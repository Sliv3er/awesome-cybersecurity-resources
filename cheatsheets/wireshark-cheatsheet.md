# Wireshark Cheatsheet

## Display Filters
```
ip.addr == 10.0.0.1
tcp.port == 80
http.request.method == GET
dns.qry.name contains "google"
tcp.flags.syn == 1 && tcp.flags.ack == 0
frame.len > 1000
```

## Capture Filters
```
host 10.0.0.1
port 80
tcp port 443
net 192.168.1.0/24
```

## Common Protocols
| Filter | Protocol |
|--------|----------|
| http | HTTP |
| dns | DNS |
| tcp | TCP |
| udp | UDP |
| tls | TLS/SSL |
| icmp | ICMP |
| arp | ARP |
| ftp | FTP |
| smtp | SMTP |

## Useful Tips
- Follow TCP Stream: Right-click packet > Follow > TCP Stream
- Export objects: File > Export Objects > HTTP
- Statistics: Statistics > Conversations / Endpoints / Protocol Hierarchy