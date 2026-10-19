#!/bin/bash 
##检查root
check_root_if_needed() {
    if [[ "$OS_NAME" == "ubuntu" ]] || [[ "$OS_NAME" == "debian" ]] || [[ "$OS_NAME" == "linuxmint" ]] || [[ "$OS_NAME" == "kali" ]]; then
        if [ "$EUID" -ne 0 ]; then
            log_error "This script requires root privileges for apt. Please run with sudo."
            exit 1
        fi
    fi
  }

intall_sing() {
  mkdir -p /etc/apt/keyrings &&
   sudo curl -fsSL https://sing-box.app/gpg.key -o /etc/apt/keyrings/sagernet.asc &&
   sudo chmod a+r /etc/apt/keyrings/sagernet.asc &&
   echo '
Types: deb
URIs: https://deb.sagernet.org/
Suites: *
Components: *
Enabled: yes
Signed-By: /etc/apt/keyrings/sagernet.asc
' | sudo tee /etc/apt/sources.list.d/sagernet.sources &&
   sudo apt-get update &&
   sudo apt-get install sing-box nano
}

check_root_if_needed 
intall_sing 


