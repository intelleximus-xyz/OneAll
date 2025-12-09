#!/bin/bash

# OneAll - GCP Setup Script for macOS

# Text Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== OneAll: Google Cloud Setup for Remote Desktop ===${NC}"

# 1. Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${RED}Error: Homebrew is not installed.${NC}"
    echo "Please install it first: https://brew.sh/"
    exit 1
fi

# 2. Install Google Cloud SDK if missing
if ! command -v gcloud &> /dev/null; then
    echo -e "${BLUE}Installing Google Cloud SDK...${NC}"
    brew install --cask google-cloud-sdk
else
    echo -e "${GREEN}Google Cloud SDK is already installed.${NC}"
fi

# 3. Authenticate
echo -e "${BLUE}Authenticating with Google Cloud...${NC}"
echo "A browser window will open. Please log in."
gcloud auth login

# 4. Configuration Prompt
echo -e "${BLUE}=== Configuration ===${NC}"
read -p "Enter your Google Cloud Project ID (e.g., my-project-123): " PROJECT_ID
read -p "Enter your VM Instance Name (e.g., windows-vm): " INSTANCE_NAME
read -p "Enter the Zone (e.g., us-central1-a): " ZONE

# 5. Set Defaults
echo -e "${BLUE}Setting default configuration...${NC}"
gcloud config set project "$PROJECT_ID"
gcloud config set compute/zone "$ZONE"

# 6. Save Config for Connect Script
CONFIG_FILE="$HOME/.oneall_config"
echo "PROJECT_ID=$PROJECT_ID" > "$CONFIG_FILE"
echo "INSTANCE_NAME=$INSTANCE_NAME" >> "$CONFIG_FILE"
echo "ZONE=$ZONE" >> "$CONFIG_FILE"

echo -e "${GREEN}Setup Complete!${NC}"
echo "You can now run './connect_vm.sh' to start the connection."
