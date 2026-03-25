# OWASP Top 10 — Quick Reference (2021)

A quick-reference cheatsheet for the most critical web application security risks.

---

## 1. A01:2021 — Broken Access Control
- Enforce least-privilege access
- Deny by default (except public resources)
- Implement server-side access control checks
- Disable directory listing
- Log access control failures and alert admins

## 2. A02:2021 — Cryptographic Failures
- Classify data by sensitivity level
- Don't store sensitive data unnecessarily
- Encrypt all data in transit (TLS 1.2+)
- Use strong, up-to-date algorithms (AES-256, RSA-2048+)
- Never use deprecated hashing (MD5, SHA1)

## 3. A03:2021 — Injection
- Use parameterized queries / prepared statements
- Use server-side input validation
- Escape special characters for the specific interpreter
- Use LIMIT and other SQL controls to prevent mass disclosure

## 4. A04:2021 — Insecure Design
- Use threat modeling during design phase
- Implement security user stories and abuse cases
- Use secure design patterns
- Integrate security review in the development lifecycle

## 5. A05:2021 — Security Misconfiguration
- Repeatable hardening process
- Minimal platform — no unnecessary features
- Review and update configurations regularly
- Segmented application architecture
- Send security directives to clients (Security Headers)

## 6. A06:2021 — Vulnerable and Outdated Components
- Remove unused dependencies
- Continuously inventory component versions
- Monitor CVE databases and security advisories
- Obtain components from official sources only

## 7. A07:2021 — Identification and Authentication Failures
- Implement multi-factor authentication
- Don't ship with default credentials
- Implement weak password checks
- Limit or delay failed login attempts
- Use server-side session management

## 8. A08:2021 — Software and Data Integrity Failures
- Use digital signatures to verify software
- Ensure libraries come from trusted repositories
- Use a code review process for changes
- Ensure CI/CD pipeline has proper access control

## 9. A09:2021 — Security Logging and Monitoring Failures
- Log login, access control, and server-side validation failures
- Ensure logs have sufficient context for forensics
- Establish effective monitoring and alerting
- Establish an incident response plan

## 10. A10:2021 — Server-Side Request Forgery (SSRF)
- Sanitize and validate all client-supplied input
- Enforce URL schema, port, and destination whitelist
- Don't send raw responses to clients
- Disable HTTP redirections

---

## 🔗 Resources
- [OWASP Top 10 Official](https://owasp.org/www-project-top-ten/)
- [OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/)
- [Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)
