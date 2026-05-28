#!/bin/bash
# NEXUS_INFRA v2.0 - Core Synchronizer
echo -e "\e[36m[*] Fetching latest source segments from server...\e[0m"
git pull origin main
echo -e "\e[32m[+] Code synchronized. Execute 'lua main.lua' to launch.\e[0m"
