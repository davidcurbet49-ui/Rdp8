#!/bin/bash

# Function to generate a 20-character secure password
generate_pass() {
    tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 20
}

# Main Menu
clear
echo "=========================================="
echo "      CODESPACES RDP & TAILSCALE          "
echo "=========================================="
echo "1) RDP Setup (Win10, IP, AuthKey, Pass)"
echo "2) Exit"
echo "=========================================="
read -p "Enter your choice: " choice

if [ "$choice" == "1" ]; then
    # 1. Install Tailscale
    curl -fsSL https://tailscale.com | sh
    sudo tailscaled --state=/var/lib/tailscale/tailscaled.state &
    sleep 3

    # 2. Tailscale Authenticate
    read -p "Enter your Tailscale AuthKey: " TS_KEY
    sudo tailscale up --authkey="$TS_KEY" --accept-routes

    # 3. Generate Credentials
    WIN_USER="windows10"
    WIN_PASS=$(generate_pass)
    
    # Create the user in the Codespace environment
    sudo useradd -m -s /bin/bash $WIN_USER
    echo "$WIN_USER:$WIN_PASS" | sudo chpasswd
    sudo usermod -aG sudo $WIN_USER

    # 4. Install RDP Server (Xrdp)
    sudo apt-get update && sudo apt-get install -y xfce4 xfce4-goodies xrdp
    echo "xfce4-session" > /home/$WIN_USER/.xsession
    sudo chown $WIN_USER:$WIN_USER /home/$WIN_USER/.xsession
    sudo /etc/init.d/xrdp start

    # 5. Output Details
    TS_IP=$(tailscale ip -4)
    echo "------------------------------------------"
    echo "TAILSCALE RUNNING ON: $TS_IP"
    echo "------------------------------------------"
    echo "WINDOWS 10 RDP LOGIN DETAILS:"
    echo "Address/IP: $TS_IP"
    echo "Username:   $WIN_USER"
    echo "Password:   $WIN_PASS"
    echo "------------------------------------------"
else
    exit 0
fi
