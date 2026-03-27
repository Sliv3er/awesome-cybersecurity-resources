# Hashcat & John the Ripper Cheatsheet

## Hashcat - Identify Hash
```bash
hashid hash.txt
hashcat --example-hashes | grep -i md5
```

## Hashcat - Common Modes
| Mode | Hash Type |
|------|-----------|
| 0 | MD5 |
| 100 | SHA1 |
| 1400 | SHA256 |
| 1800 | sha512crypt |
| 3200 | bcrypt |
| 1000 | NTLM |
| 5600 | NTLMv2 |
| 13100 | Kerberoast |

## Hashcat - Cracking
```bash
hashcat -m 0 hash.txt /usr/share/wordlists/rockyou.txt
hashcat -m 1000 hash.txt rockyou.txt --force
hashcat -m 0 hash.txt rockyou.txt -r /usr/share/hashcat/rules/best64.rule
```

## John the Ripper
```bash
john hash.txt --wordlist=/usr/share/wordlists/rockyou.txt
john hash.txt --format=raw-md5
john --show hash.txt
```

## Extract Hashes
```bash
# /etc/shadow
unshadow /etc/passwd /etc/shadow > hashes.txt

# ZIP
zip2john file.zip > hash.txt

# SSH Key
ssh2john id_rsa > hash.txt

# Keepass
keepass2john database.kdbx > hash.txt
```