# OneAll: Remote Desktop Access for Google Cloud

This project contains simple scripts to help you connect to your Windows VM on Google Cloud from your macOS machine using Identity-Aware Proxy (IAP). This method is secure and does not require opening firewall ports to the public internet.

## Prerequisites

- A macOS computer (M1/M2/M3 or Intel).
- **Microsoft Remote Desktop** installed from the Mac App Store.
- **Homebrew** installed (if not, the script will warn you).

## Usage

### 1. Setup (Run once)
Open your terminal, navigate to this folder, and run:

```bash
chmod +x setup_gcp_access.sh
./setup_gcp_access.sh
```

Follow the prompts to:
1.  Install Google Cloud SDK.
2.  Login to your Google account.
3.  Enter your Project ID, VM Name, and Zone.

### 2. Connect (Daily usage)
Whenever you want to work:

```bash
chmod +x connect_vm.sh
./connect_vm.sh
```

- Keep the terminal window open.
- Open **Microsoft Remote Desktop**.
- Connect to PC: `localhost:3389`.
- Enter your Windows username and password.

### 3. Stop
To stop the connection, just press `Ctrl+C` in the terminal window.
