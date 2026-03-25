# Nmap Cheatsheet

Quick reference for the most common Nmap commands.

---

## Basic Scans

```bash
# Scan a single host
nmap 192.168.1.1

# Scan a range
nmap 192.168.1.1-254

# Scan a subnet
nmap 192.168.1.0/24

# Scan from file
nmap -iL targets.txt
```

## Port Scanning

```bash
# Scan specific ports
nmap -p 80,443,8080 target

# Scan port range
nmap -p 1-1000 target

# Scan all 65535 ports
nmap -p- target

# Top 100 ports (fast)
nmap --top-ports 100 target

# UDP scan
nmap -sU target
```

## Service & Version Detection

```bash
# Service version detection
nmap -sV target

# Aggressive version detection
nmap -sV --version-intensity 5 target

# OS detection
nmap -O target

# OS + version + scripts + traceroute
nmap -A target
```

## Scan Types

```bash
# TCP SYN scan (stealth, default with root)
nmap -sS target

# TCP Connect scan (default without root)
nmap -sT target

# Ping scan (host discovery only)
nmap -sn 192.168.1.0/24

# No ping (skip host discovery)
nmap -Pn target
```

## NSE Scripts

```bash
# Default scripts
nmap -sC target

# Specific script
nmap --script=http-title target

# Script categories
nmap --script=vuln target
nmap --script=safe target
nmap --script=discovery target

# Multiple scripts
nmap --script="http-title,http-headers" target

# Script + args
nmap --script=http-brute --script-args http-brute.path=/admin target
```

## Output Formats

```bash
# Normal output
nmap -oN scan.txt target

# XML output
nmap -oX scan.xml target

# Grepable output
nmap -oG scan.gnmap target

# All formats
nmap -oA scan target
```

## Speed & Timing

```bash
# Timing templates (T0=paranoid to T5=insane)
nmap -T4 target    # Aggressive (recommended)
nmap -T1 target    # Sneaky (IDS evasion)

# Max rate
nmap --max-rate 1000 target

# Min rate
nmap --min-rate 100 target
```

## Common Combos

```bash
# Fast comprehensive scan
nmap -sS -sV -sC -O -T4 target

# Full port scan + services
nmap -p- -sV -T4 target

# Stealth scan
nmap -sS -T2 -f --data-length 24 target

# Web server recon
nmap -p 80,443 --script="http-*" target

# Quick vulnerability scan
nmap -sV --script=vuln target
```

---

> 📖 Full docs: https://nmap.org/book/man.html
