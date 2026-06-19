#!/bin/bash

# UFW Basic Firewall Configuration Script
# Task 2: Basic Firewall Configuration with UFW

set -e

echo "UFW Basic Firewall Configuration Script"

# Step 1: Install UFW
echo "[*] Step 1: Installing UFW..."
sudo apt install ufw -y

# Verify installation
echo "[*] Verifying UFW installation..."
ufw --version

# Step 2: Configure firewall rules
echo "[*] Step 2: Configuring firewall rules..."

# Allow SSH (port 22/tcp) before enabling UFW
echo "[+] Allowing SSH (port 22)..."
sudo ufw allow ssh

# Deny HTTP (port 80/tcp)
echo "[-] Denying HTTP (port 80/tcp)..."
sudo ufw deny 80/tcp

# Step 3: Enable the firewall
echo "[*] Step 3: Enabling UFW..."
sudo ufw enable

# Step 4: Verify firewall status
echo "[*] Step 4: Checking firewall status..."
sudo ufw status verbose

echo "Firewall configuration complete!"

echo "Rules applied:"
echo "ALLOW: 22/tcp (SSH)"
echo "DENY: 80/tcp (HTTP)"
