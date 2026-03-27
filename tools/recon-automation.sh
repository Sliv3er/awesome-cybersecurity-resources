#!/bin/bash
# Automated Reconnaissance Script
# Author: Ayoub Ghodhbane
# Usage: ./recon-automation.sh target.com

TARGET=$1
OUTPUT_DIR="./recon/$TARGET"

if [ -z "$TARGET" ]; then
    echo "Usage: ./recon-automation.sh <target>"
    exit 1
fi

mkdir -p $OUTPUT_DIR

echo "[*] Starting recon on $TARGET..."

# Subdomain enumeration
echo "[+] Subdomain enumeration..."
subfinder -d $TARGET -o $OUTPUT_DIR/subdomains.txt 2>/dev/null

# Port scanning
echo "[+] Port scanning..."
nmap -sS -T4 --top-ports 1000 $TARGET -oN $OUTPUT_DIR/nmap.txt 2>/dev/null

# Directory bruteforce
echo "[+] Directory bruteforce..."
ffuf -u "https://$TARGET/FUZZ" -w /usr/share/wordlists/dirb/common.txt -o $OUTPUT_DIR/dirs.json 2>/dev/null

echo "[*] Recon complete! Results in $OUTPUT_DIR/"