# PiCash

A lightweight docker image running many "passive" income applications, built for a Raspberry Pi.

Currenlty installed programs are:
- [x] Honeygain
- [x] EarnApp 
- [x] Pawns.app (IPRoyal Pawns)
- [x] PacketStream
- [x] Peer2Profit
- [x] Traffmonetizer

64bit Raspberry Pi's are supported (4, z2w, 3b+)

---


You will need an account at each of these sites
- Supported [Register Earnapp](https://earnapp.com/i/p9c6p7r)
- Supported [Register Honeygain](https://r.honeygain.me/MATTH77B97)
- Supported [Register Peer2profit](https://p2pr.me/16630967886320d7d435020)
- Supported [Register Pawns.app(Formerly IPRoyal Pawns)](https://pawns.app?r=538917)
- Supported [Register Packetstream](https://packetstream.io/?psr=3dq9)
- Supported [Register Traffmonetizer](https://traffmonetizer.com/?aff=522583)


**These are affiliate links, please use them to support development





---
## Quick start
Docker is required (maybe when fedora 37 lands we can look at using podman)
### Docker installs
> Ubuntu: https://docs.docker.com/engine/install/ubuntu/<br>
> Debian: https://docs.docker.com/engine/install/debian/<br>
> Raspbian: https://www.simplilearn.com/tutorials/docker-tutorial/raspberry-pi-docker


<br>

git clone onto a arm64 platform

```
git clone https://github.com/chashtag/PiCash.git && cd PiCash
```

Edit the `settings.conf` file

build and run the container via `./run.sh`





---
<br><br>
# Earnapp
Register an account.

The container will give you a link that you need to paste into your browser to "link" the worker to your account. <b>This needs to be repeated per container instance!</b>
<br><br><br>
To get this code you can execute command below .

``` 
docker exec -ti picash earnapp register | grep -Eo 'https.+'
```
Set `USE_EARNAPP` to `y` in the `settings.conf` file.
<br><br>Example
```
USE_EARNAPP=y
```
<br><br>
# Honeygain

Register an account.
In the settings file, add your email to `HG_EMAIL` and password to `HG_PASSWORD` and set the `USE_HONEYGAIN` to `y`.
<br><br>Example
```
USE_HONEYGAIN=y
HG_EMAIL='example@example.com'
HG_PASSWORD='MyP@$$W0rd'
```
<br><br><br>
# Packet Stream
Register an account. In the settings file set `USE_PACKET_STREAM` to `y` and `PS_ID` to your 