#!/bin/sh
# Setup WireGuard VPN to auto-connect on startup
# Usage: vpn-setup <config_name>

CONFIG_NAME=${1:-austria_1}

echo "Setting up VPN autoconnect for: $CONFIG_NAME"

# Create systemd service file
sudo tee /etc/systemd/system/wg-quick@$CONFIG_NAME.service > /dev/null <<EOF
[Unit]
Description=WireGuard VPN ($CONFIG_NAME)
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=$HOME/.nix-profile/bin/wg-quick up $HOME/.config/wireguard/$CONFIG_NAME.conf
ExecStop=$HOME/.nix-profile/bin/wg-quick down $HOME/.config/wireguard/$CONFIG_NAME.conf

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and enable service
sudo systemctl daemon-reload
sudo systemctl enable "wg-quick@$CONFIG_NAME"

echo "✓ VPN autoconnect enabled for $CONFIG_NAME"
echo ""
echo "Commands:"
echo "  sudo systemctl start wg-quick@$CONFIG_NAME   # Start now"
echo "  sudo systemctl stop wg-quick@$CONFIG_NAME    # Stop now"
echo "  sudo systemctl status wg-quick@$CONFIG_NAME  # Check status"
echo "  sudo systemctl disable wg-quick@$CONFIG_NAME # Disable on boot"
