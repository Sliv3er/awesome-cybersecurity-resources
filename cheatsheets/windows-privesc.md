# Windows Privilege Escalation Cheatsheet

## Enumeration
```cmd
whoami /all
systeminfo
net user
net localgroup administrators
ipconfig /all
netstat -ano
```

## Service Exploits
```cmd
sc qc ServiceName
sc query state= all
wmic service get name,displayname,pathname,startmode
```

## Unquoted Service Paths
```cmd
wmic service get name,displayname,pathname,startmode | findstr /i "auto" | findstr /i /v "C:\Windows"
```

## Registry AutoRuns
```cmd
reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
reg query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
```

## AlwaysInstallElevated
```cmd
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated
```

## Stored Credentials
```cmd
cmdkey /list
runas /savecred /user:admin cmd.exe
```

## Automated Tools
- WinPEAS, PowerUp, Seatbelt, SharpUp

> Full guide: https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation