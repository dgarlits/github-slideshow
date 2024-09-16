#!/bin/bash

# Module 1: Ask for sudo password
echo "Please enter your sudo password:"
sudo -v

# Module 2: Set global theme to Breeze Dark, update and upgrade the system
echo "Setting global theme to Breeze Dark and updating the system..."
lookandfeeltool -a org.kde.breezedark.desktop
sudo apt update && sudo apt upgrade -y

# Module 3: Uninstall LibreOffice
echo "Uninstalling LibreOffice..."
sudo apt purge libreoffice* -y
sudo apt autoremove -y

# Module 4: Install OnlyOffice Desktop Editors using Snap
echo "Installing OnlyOffice Desktop Editors via Snap..."
sudo snap install onlyoffice-desktopeditors

# Module 5: Check if OnlyOffice is installed
if snap list | grep onlyoffice-desktopeditors &> /dev/null; then
    echo "OnlyOffice is installed correctly."
else
    echo "OnlyOffice installation failed."
fi

# Module 6: Announce that the script is complete
echo "Script execution complete."
