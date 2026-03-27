# Gobuster & FFUF Cheatsheet

## Gobuster - Directory
```bash
gobuster dir -u http://target.com -w /usr/share/wordlists/dirb/common.txt -t 50
gobuster dir -u http://target.com -w /usr/share/seclists/Discovery/Web-Content/big.txt -x php,html,txt -t 50
```

## Gobuster - DNS
```bash
gobuster dns -d target.com -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
```

## Gobuster - Vhost
```bash
gobuster vhost -u http://target.com -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
```

## FFUF - Directory
```bash
ffuf -u http://target.com/FUZZ -w /usr/share/wordlists/dirb/common.txt
ffuf -u http://target.com/FUZZ -w wordlist.txt -fc 404 -t 100
```

## FFUF - Subdomains
```bash
ffuf -u http://FUZZ.target.com -w subdomains.txt -fc 301
```

## FFUF - Parameter Fuzzing
```bash
ffuf -u http://target.com/page?FUZZ=test -w params.txt -fs 4242
ffuf -u http://target.com/page?id=FUZZ -w numbers.txt -fc 500
```

## FFUF - POST Data
```bash
ffuf -u http://target.com/login -X POST -d "username=admin&password=FUZZ" -w passwords.txt -fc 401
```