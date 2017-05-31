# HentaiAtHome

## Requirement
- [Docker](https://docs.docker.com/engine/installation/)
- H@H ID
- make

## H@H settings

Click client name to setting page

**Reset Client Key** and **Reset Static Ranges** at first time

set **port** at top

## Install

```
$ git clone https://github.com/FlandreDaisuki/HentaiAtHome.git
$ cd HentaiAtHome
```

To install Docker-CE for Ubuntu 16.04 on amd64

```
$ make install-docker-ce-for-xenial-amd64
```

To install **other Docker version** for **other OS** on **other arch**
```
$ make install-docker
```
## Post-install
```
$ make pre-setup
```

then re-login desktop session
and make sure this folder path to be server

## Run docker
```
$ make run
```

then 

- enter your Client ID
- enter your key

then close terminal

## Check

`$ docker ps`
