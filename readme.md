DuckDNS Auto-Updater / Actualizador Automatico de DuckDNS
English Version
Description

A Bash script to automatically update your DuckDNS subdomain with your current public IP address or a custom IP. Designed for dynamic DNS management.
Features

    Reads configuration from file (~/AutoRS/DuckDNS_conf.txt)

    Supports both automatic and manual IP modes

    Command-line arguments for quick configuration

    Color-coded output for better readability

    DuckDNS API integration

Configuration

Create a config file at ~/AutoRS/DuckDNS_conf.txt with this format:
Copy

token="your_duckdns_token"
domain="your_subdomain"
MyIp="auto"  # or specific IP like "123.45.67.89"

Usage

Basic:
Copy

./script.sh

With arguments:
Copy

./script.sh -d your_subdomain -t your_token -i IP_address

Help menu:
Copy

./script.sh -h

Requirements

    Bash

    curl

    Internet connection

Version en Castellano
Descripcion

Script en Bash para actualizar automaticamente tu subdominio DuckDNS con tu IP publica actual o una IP manual. Ideal para gestionar DNS dinamicos.
Caracteristicas

    Lee configuracion desde archivo (~/AutoRS/DuckDNS_conf.txt)

    Soporta modo automatico y manual para IP

    Argumentos por linea de comandos para configuracion rapida

    Salida con colores para mejor legibilidad

    Integracion con API de DuckDNS

Configuracion

Crea un archivo en ~/AutoRS/DuckDNS_conf.txt con este formato:
Copy

token="tu_token_duckdns"
domain="tu_subdominio"
MyIp="auto"  # o IP especifica como "123.45.67.89"

Uso

Basico:
Copy

./script.sh

Con argumentos:
Copy

./script.sh -d tu_subdominio -t tu_token -i IP_manual

Ayuda:
Copy

./script.sh -h

Requisitos

    Bash

    curl

    Conexion a internet

Note: The script path (./script.sh) should be replaced with your actual script filename. The configuration file path (~/AutoRS/DuckDNS_conf.txt) can also be adjusted if needed.


Programa creado con la ayuda de una IA.....
