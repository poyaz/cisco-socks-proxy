Introduction
============

This service for connect to CISCO VPN and use with Socks V5 proxy


Run
===

* After clone project you should copy .env.example to .env (For config service)

```bash
cp env/cisco/.env.example env/cisco/.env
```

* Then you fill CISCO VPN environment variable in `.env` file

* Now start docker container

```bash
docker-compose -f docker-compose.yml -f docker/docker-compose.env.yml up -d
```

Usa proxy
=========

This service create network in range 10.101.0.0/29 and proxy run in 10.101.0.2

```bash
### No need use username and password for connect to proxy

curl -x socks5h://10.101.0.2:1080 ifconfig.io
```
