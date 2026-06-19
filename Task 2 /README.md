## Objective
Configure a basic firewall using UFW on a Linux system.

## Commands Used

- sudo apt install ufw -y
- sudo ufw allow ssh
- sudo ufw deny 80/tcp
- sudo ufw enable
- sudo ufw status verbose

## Configuration
- Allowed SSH traffic on port 22.
- Denied HTTP traffic on port 80.
- Enabled the firewall.

## Verification
Firewall status was verified using:

sudo ufw status verbose

The output confirmed that SSH is allowed and HTTP is blocked.
