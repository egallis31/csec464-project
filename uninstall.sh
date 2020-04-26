#!/bin/bash
docker container rm -f grr-server
docker network prune
systemctl disable grr
apt purge grr*
apt autoremove
rm -r /usr/lib/grr/*
rm /etc/grr.local.yaml
rm /etc/init/grr.conf