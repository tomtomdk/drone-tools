#!/bin/bash


TEMPLATE_HTML_FILE="../templates/index.template"
TARGET_HTML_FILE="../index.html"
SEARCH_PATTERN='value="rtmp://[^"]+/live/stream"'

# Ensure the file exists
if [[ ! -f "$TEMPLATE_HTML_FILE" ]]; then
    echo "❌ Error: $TEMPLATE_HTML_FILE not found."
    exit 1
fi

# Extract current host value from index.html
CURRENT_VALUE=$(grep -oP 'value="rtmp://\K[^"]+(?=/live/stream")' "$TEMPLATE_HTML_FILE")

# Check if it's the placeholder or a real IP/host
if [[ "$CURRENT_VALUE" == "HOSTIP-PLACE-HOLDER" ]]; then
    echo "ℹ️ RTMP host is not currently set in $TEMPLATE_HTML_FILE."
else
    echo "ℹ️ Current RTMP host set in $TEMPLATE_HTML_FILE: $CURRENT_VALUE"
fi

# Prompt user to keep or update
read -rp "Do you want to change it? [y/N]: " RESPONSE

if [[ ! "$RESPONSE" =~ ^[Yy]$ ]]; then
    echo "✅ Keeping current setting: $CURRENT_VALUE"
    exit 0
fi

# Prompt for new IP or hostname
read -rp "Enter new public IP or hostname of the Docker host: " NEW_HOST

# Validation
IP_REGEX="^([0-9]{1,3}\.){3}[0-9]{1,3}$"
HOSTNAME_REGEX="^(([a-zA-Z0-9-]+\.)*[a-zA-Z0-9-]+\.[a-zA-Z]{2,}|localhost)$"

if [[ $NEW_HOST =~ $IP_REGEX || $NEW_HOST =~ $HOSTNAME_REGEX ]]; then
    echo "✅ Valid input: $NEW_HOST"
else
    echo "❌ Invalid IP address or hostname."
    exit 1
fi

# Backup before replacing
cp "$TEMPLATE_HTML_FILE" "$TARGET_HTML_FILE"

# Replace the host portion in the value string
sed -i -E "s@($SEARCH_PATTERN)@value=\"rtmp://$NEW_HOST/live/stream\"@" "$TARGET_HTML_FILE"

echo "✔️ Updated RTMP host in $TARGET_HTML_FILE to: $NEW_HOST"
