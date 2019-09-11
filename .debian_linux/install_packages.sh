#!/usr/bin/env bash
sudo apt update -y
sudo apt upgrade -y
sudo xargs -a pkglistubuntu.txt apt install
