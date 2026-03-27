#!/usr/bin/env python3
"""Simple multi-threaded port scanner - Author: Ayoub Ghodhbane"""

import socket
import threading
import sys
from concurrent.futures import ThreadPoolExecutor

def scan_port(target, port):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        result = sock.connect_ex((target, port))
        if result == 0:
            try:
                service = socket.getservbyport(port)
            except:
                service = "unknown"
            print(f"  [OPEN] Port {port} ({service})")
        sock.close()
    except:
        pass

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 port-scanner.py <target> [start_port] [end_port]")
        sys.exit(1)

    target = sys.argv[1]
    start_port = int(sys.argv[2]) if len(sys.argv) > 2 else 1
    end_port = int(sys.argv[3]) if len(sys.argv) > 3 else 1024

    print(f"\nScanning {target} (ports {start_port}-{end_port})...\n")

    with ThreadPoolExecutor(max_workers=100) as executor:
        for port in range(start_port, end_port + 1):
            executor.submit(scan_port, target, port)

    print("\nScan complete.")

if __name__ == "__main__":
    main()