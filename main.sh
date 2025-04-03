#!/bin/bash

#CONFIGURATION FILE
CONFIG_FILE="$HOME/Duckdns-autoupdater/DuckDNS_conf.txt"

#DEFAULT CONFIGURATION
domain=""
token=""
MyIp="auto"

#FUNC TO READ CONFIG FILE
read_config() {
         if [ -f "$CONFIG_FILE" ]; then
                echo -e "${green}Reading config file: $CONFIG_FILE ${reset}"
        # Extracting values from config file
         token=$(grep -Ei '^token=' "$CONFIG_FILE" | cut -d'=' -f2 | tr -d '[:space:]"' | tr -d "'")
        domain=$(grep -Ei '^domain=' "$CONFIG_FILE" | cut -d'=' -f2 | tr -d '[:space:]"' | tr -d "'")
        MyIp=$(grep -Ei '^MyIp=' "$CONFIG_FILE" | cut -d'=' -f2 | tr -d '[:space:]"' | tr -d "'")
        [ -n "$MyIp_FILE" ] && MyIp_FILE="$IP"
        fi
}

read_config


#COLORS

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
reset="\e[0m"

#HELP FUNCTION
show_help() {
    echo -e "${green}Uso:${reset}"
    echo "  ./script.sh [opciones]"
    echo -e "${green}Opciones:${reset}"
    echo "  -d <dominio>   Specify subdomain DuckDNS"
    echo "  -t <token>     Use another token"
    echo "  -i <IP>        Manual IP (ej: 90.162.86.29)"
    echo "  -h             Show help"
    exit 0
}

#ARGUMENT PROCESSING
while getopts ":d:t:i:h" opt; do
    case $opt in
        d) domain="$OPTARG" ;;
        t) token="$OPTARG" ;;
        i) MyIp="$OPTARG" ;;
        h) show_help ;;
        *) echo -e "${red}Opción inválida: -$OPTARG${reset}" >&2; exit 1 ;;
    esac
done

#GET PUBLIC IP
if [ "$MyIp" = "auto" ]; then
        echo -e "${yellow}Getting public IP...${reset}"
        MyIp=$(curl -s ident.me || curl -s icanhazip.com)
                if [ -z "$MyIp" ]; then
                        echo -e "${red}Error al obtener IP pública de forma automática${reset}"
                        exit 1
                fi
fi

#Show configuration
echo -e "${green}----------------${green}"
echo -e "${yellow}Configuration:${reset}"
echo -e "${yellow}PUBLIC IP${reset}: ${red}$MyIp${reset}"
echo -e "${yellow}TOKEN${reset}: ${red}$token${reset}"
echo -e "${yellow}DOMAIN${reset}: ${red}$domain${reset}"
echo -e "${green}----------------${reset}"

#Updating DuckDNS

echo -e "${yellow}Updating DuckDNS...${reset}"
url="https://www.duckdns.org/update/$domain/$token/$MyIp"

answer=$(curl -s "$url")

if [[ "$answer" == "OK" ]]; then
        echo -e "${green} Subdomain updated ${reset}"
else
        echo -e "${red} Subdomain can't be updated"
fi
