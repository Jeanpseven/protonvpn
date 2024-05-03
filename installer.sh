#!/bin/bash

# Verificar se o ProtonVPN está instalado
if dpkg -l | grep -q "protonvpn-gui"; then
    echo "ProtonVPN já está instalado."
else
    echo "ProtonVPN não está instalado. Instalando..."
    wget https://repo2.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-3_all.deb
    sudo dpkg -i ./protonvpn-stable-release_1.0.3-3_all.deb
    sudo apt update
    sudo apt install proton-vpn-gnome-desktop
    sudo apt install protonvpn-gui
    sudo apt install libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator
fi

# Verifica se a variável DBUS_SESSION_BUS_ADDRESS está definida
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    # Se não estiver definida, executa dbus-launch e exporta o resultado
    export $(dbus-launch)
    DBUS_SESSION_BUS_ADDRESS=$(echo $DBUS_SESSION_BUS_ADDRESS | cut -d '=' -f 2)
    echo "DBUS_SESSION_BUS_ADDRESS definida como: $DBUS_SESSION_BUS_ADDRESS"
else
    echo "DBUS_SESSION_BUS_ADDRESS já está definida como: $DBUS_SESSION_BUS_ADDRESS"
fi
