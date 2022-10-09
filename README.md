# PiCash

A lightweight docker image running many "passive" income applications, built for a Raspberry Pi.

Currenlty installed programs are:
- [x] Honeygain
- [x] EarnApp 
- [x] Pawns.app (IPRoyal Pawns)
- [x] PacketStream
- [x] Peer2Profit
- [x] Traffmonetizer (x86_64 broke)
- [x] BitPing


64/32bit Raspberry Pi's are supported (4, Zero2 W, 3b+) aarch64, arm7l
---


You will need an account at each of these sites
- [Register Earnapp](https://earnapp.com/i/p9c6p7r)
- [Register Honeygain](https://r.honeygain.me/MATTH77B97)
- [Register Peer2profit](https://p2pr.me/16630967886320d7d435020)
- [Register Pawns.app(Formerly IPRoyal Pawns)](https://pawns.app?r=538917)
- [Register Packetstream](https://packetstream.io/?psr=3dq9)
- [Register Traffmonetizer](https://traffmonetizer.com/?aff=522583)
- [Register BitPing](https://app.bitping.com?r=3TGus9GO) *Crypto payout


**These are affiliate links, please use them to support development





---
<br>
<br>

# Quick start
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

Build and run the container via `./run.sh`
<br>
<br>
<br>

To enable automatic updates you can use [watchtower](https://containrrr.dev/watchtower/)
```
docker run -d \
--name watchtower \
--restart always \
-v /var/run/docker.sock:/var/run/docker.sock \
containrrr/watchtower
```



---
### TO-DO:
- [x] make a multi arch build
- [ ] make a one-liner build and install for supported OS's


---
<br><br>
# Earnapp
Register for an account. Set `USE_EARNAPP` to `y` in the `settings.conf` file.

The container will give you a link that you need to paste into your browser to "link" the worker to your account. <b>This needs to be repeated per container instance!</b>
<br><br><br>
To get this code you can execute command below .

``` 
docker exec -ti picash earnapp register | grep -Eo 'https.+'
```

<br><br>Example
```
# Earnapp
USE_EARNAPP=y
```
<br><br>
# Honeygain

Register for an account.
In the settings file, add your email to `HG_EMAIL` and password to `HG_PASSWORD` and set the `USE_HONEYGAIN` to `y`.
<br><br>Example
```
# Honeygain
USE_HONEYGAIN=y
HG_EMAIL='example@example.com'
HG_PASSWORD='MyP@$$W0rd'
```
<br><br><br>
# Packet Stream
Register for an account. In the settings file set `USE_PACKET_STREAM` to `y` and `PS_ID` to your CID. You can find your CID by navigating to the [Download page](https://packetstream.io/dashboard/download) and scrolling the bottom where it give you "Linux" instructions. Inside that blob of text you will find your CID, below is a picture of where it can be found.

![cid](https://github.com/chashtag/PiCash/blob/images/images/packetstream.png?raw=true)
<br><br>Example
```
# Packet Stream
USE_PACKET_STREAM=y
PS_ID=abc123
```
<br><br><br>

# Peer2Profit
Register for an account. In the settings file set `USE_PEER2PROFIT` to `y` and `P2_EMAIL` to your email.
<br><br>Example
```
# Peer2Profit
USE_PEER2PROFIT=y
P2_EMAIL='example@example.com'
```

<br><br><br>

# Pawns.app(IPPawns)
Register for an account. In the settings file, add your email to `PA_EMAIL` and password to `PA_PASSWORD` and set the `USE_PAWNSAPP` to `y`.

<br><br>Example
```
# Pawns.app(IPPawns)
USE_PAWNSAPP=y
PA_EMAIL='example@example.com
PA_PASSWORD='MyP@$$W0rd'
```
<br><br><br>

# Traffmonetizer
Register for an account. In the settings file, add your `Application Token` to `TRAFF_TOKEN` and set the `USE_TRAFFMONETIZER` to `y`.

You can find the `Application Token` on your [dashboard](https://app.traffmonetizer.com/dashboard).

<br><br>Example
```
# Traffmonetizer
USE_TRAFFMONETIZER=y
TRAFF_TOKEN='ZXhhbXBsZUVYQU1QTEVleGFtcGxlRVhBTVBMRQo='
```

<br><br><br>
# Bitping
Register for an account. In the settings file, add your email to `BP_EMAIL` and password to `BP_PASSWORD` and set the `USE_BITPING` to `y`.

<br><br>Example
```
# BitPing
USE_BITPING=y
BP_EMAIL='example@example.com'
BP_PASSWORD='MyP@$$W0rd'
```