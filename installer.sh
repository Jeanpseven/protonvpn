#!/bin/bash

wget https://repo2.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-3_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.3-3_all.deb && sudo apt update
sudo apt install proton-vpn-gnome-desktop

# Verificar se o ProtonVPN está instalado
if dpkg -l | grep -q "protonvpn-gui"; then
    echo "ProtonVPN já está instalado."
else
    echo "ProtonVPN não está instalado. Instalando..."
    sudo apt update
    sudo apt install protonvpn-gui
    sudo apt install proton-vpn-gnome-desktop
fi
