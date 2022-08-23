Introduction
============

This service for connect to CISCO VPN and use with Socks V5 proxy

Run
===

After clone project you should copy .env.example to .env (For config service). Then you fill CISCO VPN environment
variable in `.env` file

```bash
cp env/cisco/.env.example env/cisco/.env

# Fill variable with you editor
vi env/cisco/.env
```

Before you start creating iptables rules, you should make some alterations to the sysctl configuration. You can use
below command for check sysctl `net.ipv4.ip_forward`

```bash
sysctl net.ipv4.ip_forward
```

if Output of above command is zero you have to execute below command for enable `net.ipv4.ip_forward`

```bash
sysctl -w net.ipv4.ip_forward=1

# Or
echo 1 > /proc/sys/net/ipv4/ip_forward
```

After editing the file, you can run the following command to make the changes take effect right away.

```bash
sysctl -p
```

Now start docker container

```bash
docker-compose -f docker-compose.yml -f docker/docker-compose.env.yml up -d
```

Usa proxy
=========

This service create network in range 10.101.0.0/29 and proxy run in 10.101.0.2

```bash
### No need use username and password for connect to proxy

### Socks proxy
curl -x socks5h://10.101.0.2:1080 ifconfig.io

### Http proxy
curl -x http://10.101.0.2:10001 ifconfig.io
```
