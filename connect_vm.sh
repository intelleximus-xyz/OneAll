#!/bin/bash

# OneAll - Connect to VM Script

# Load Config
CONFIG_FILE="$HOME/.oneall_config"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration not found. Please run ./setup_gcp_access.sh first."
    exit 1
fi

source "$CONFIG_FILE"

echo "=== Connecting to $INSTANCE_NAME ($ZONE) ==="
echo "Project: $PROJECT_ID"

# Check if port 3389 is already in use locally
if lsof -Pi :3389 -sTCP:LISTEN -t >/dev/null ; then
    echo "Warning: Port 3389 is already in use. Killing existing tunnels..."
    lsof -t -i:3389 | xargs kill -9
fi

echo "Starting IAP Tunnel..."
echo "Once the tunnel is ready, open Microsoft Remote Desktop and connect to: localhost:3389"
echo "Press Ctrl+C to stop the connection."

# Start Tunnel
gcloud compute start-iap-tunnel "$INSTANCE_NAME" 3389 \
    --local-host-port=localhost:3389 \
    --project="$PROJECT_ID" \
    --zone="$ZONE"
