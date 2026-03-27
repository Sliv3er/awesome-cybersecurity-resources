#!/bin/bash
# Subdomain Enumeration Script - Ayoub Ghodhbane
TARGET=$1
if [ -z "$TARGET" ]; then echo "Usage: ./subdomain-enum.sh domain.com"; exit 1; fi

echo "[*] Enumerating subdomains for $TARGET"
mkdir -p results

echo "[+] Running subfinder..."
subfinder -d $TARGET -silent -o results/subfinder.txt 2>/dev/null

echo "[+] Running amass..."
amass enum -passive -d $TARGET -o results/amass.txt 2>/dev/null

echo "[+] Combining results..."
cat results/*.txt | sort -u > results/all-subdomains.txt
echo "[*] Found $(wc -l < results/all-subdomains.txt) unique subdomains"

echo "[+] Checking live hosts..."
cat results/all-subdomains.txt | httpx -silent -o results/live-hosts.txt 2>/dev/null
echo "[*] $(wc -l < results/live-hosts.txt) live hosts found"
echo "[*] Results saved to results/"