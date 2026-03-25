# Burp Suite Cheatsheet

Quick reference for web application penetration testing with Burp Suite.

---

## Proxy Setup

1. Set browser proxy to `127.0.0.1:8080`
2. Install Burp CA certificate for HTTPS interception
3. Enable "Intercept" in Proxy tab

## Key Tabs

| Tab | Purpose |
|-----|---------|
| **Proxy** | Intercept and modify HTTP/HTTPS requests |
| **Target** | Site map and scope definition |
| **Repeater** | Manually modify and resend requests |
| **Intruder** | Automated attacks (fuzzing, brute force) |
| **Scanner** | Automated vulnerability scanning (Pro) |
| **Decoder** | Encode/decode data (Base64, URL, HTML) |
| **Comparer** | Compare two pieces of data |
| **Sequencer** | Analyze token randomness |

## Common Workflows

### SQL Injection Testing
1. Capture login request in Proxy
2. Send to Repeater (Ctrl+R)
3. Modify parameter: `' OR '1'='1`
4. Check response for auth bypass

### XSS Testing
1. Find input reflection in response
2. Try: `<script>alert(1)</script>`
3. Try encoded: `%3Cscript%3Ealert(1)%3C/script%3E`
4. Try event handlers: `" onmouseover="alert(1)`

### Brute Force (Intruder)
1. Capture login request → Send to Intruder
2. Mark payload position (username/password field)
3. Choose attack type: Sniper, Battering Ram, Pitchfork, Cluster Bomb
4. Load wordlist and start attack
5. Filter results by response length/status

## Useful Extensions
- **Authorize** — Authorization testing
- **Logger++** — Advanced logging
- **JSON Beautifier** — Pretty-print JSON
- **Param Miner** — Hidden parameter discovery
- **Turbo Intruder** — High-speed attacks

---

> 📖 Docs: https://portswigger.net/burp/documentation
