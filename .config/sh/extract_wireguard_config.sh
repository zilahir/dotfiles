#!/usr/bin/env bash

ACCESS_TOKEN=""
TOTAL_CONFIGS=3
DNS="1.1.1.1"

CREDENTIALS_URL="https://api.nordvpn.com/v1/users/services/credentials"
SERVER_RECOMMENDATIONS_URL="https://api.nordvpn.com/v1/servers/recommendations?&filters\[servers_technologies\]\[identifier\]=wireguard_udp&limit=$TOTAL_CONFIGS"

PRIVATE_KEY=$(curl -s -u token:"$ACCESS_TOKEN" "$CREDENTIALS_URL" | jq -r .nordlynx_private_key)

curl -s "$SERVER_RECOMMENDATIONS_URL" |
	jq -r --arg private_key "$PRIVATE_KEY" --arg dns "$DNS" '
    .[] |
    {
      filename: (.locations[0].country.name + " - " + .locations[0].country.city.name + " - " + .hostname + ".conf"),
      ip: .station,
      publicKey: (.technologies | .[] | select(.identifier == "wireguard_udp") | .metadata | .[] | .value)
    } |
    {
      filename: .filename,
      config: [
        "# " + .filename,
        "",
        "[Interface]",
        "PrivateKey = \($private_key)",
        "Address = 10.5.0.2/32",
        "DNS = \($dns)",
        "",
        "[Peer]",
        "PublicKey = " + .publicKey,
        "AllowedIPs = 0.0.0.0/0, ::/0",
        "Endpoint = " + .ip + ":51820"
      ] | join("\n")
    } |
    "echo \"" + .config + "\" > \"" + .filename + "\""
  ' | sh
