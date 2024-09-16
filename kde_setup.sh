#!/bin/bash

# Module 1: Ask for sudo password
echo "Please enter your sudo password:"
sudo -v

# Module 2: Set global theme to Breeze Dark, update and upgrade the system
echo "Setting global theme to Breeze Dark and updating the system..."
kwriteconfig5 --file ~/.config/kdeglobals --group General --key Name "Breeze-Dark"
sudo apt update && sudo apt upgrade -y

# Module 3: Uninstall LibreOffice
echo "Uninstalling LibreOffice..."
sudo apt purge libreoffice* -y
sudo apt autoremove -y

# Module 4: Install OnlyOffice Desktop Editors
echo "Installing OnlyOffice Desktop Editors..."
mkdir -p -m 700 ~/.gnupg
gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
chmod 644 /tmp/onlyoffice.gpg
sudo chown root:root /tmp/onlyoffice.gpg
sudo mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg
sudo apt-get update
sudo apt-get install onlyoffice-desktopeditors -y

# Module 5: Check if OnlyOffice is installed
if command -v onlyoffice-desktopeditors &> /dev/null; then
    echo "OnlyOffice is installed correctly."
else
    echo "OnlyOffice installation failed."
fi

# Module 6: Announce that the script is complete
echo "Script execution complete."
