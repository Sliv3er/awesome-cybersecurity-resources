# Linux Privilege Escalation Cheatsheet

## Initial Enumeration
```bash
id && whoami && sudo -l
uname -a && cat /etc/os-release
cat /etc/passwd && cat /etc/group
ip a && ss -tulpn
```

## SUID / SGID Binaries
```bash
find / -perm -4000 -type f 2>/dev/null
find / -perm -2000 -type f 2>/dev/null
```

## Writable Files and Cron Jobs
```bash
find / -writable -type f 2>/dev/null
cat /etc/crontab && ls -la /etc/cron.*
```

## Capabilities
```bash
getcap -r / 2>/dev/null
```

## Automated Tools
- LinPEAS, LinEnum, linux-exploit-suggester

> Full guide: https://book.hacktricks.xyz/linux-hardening/privilege-escalation