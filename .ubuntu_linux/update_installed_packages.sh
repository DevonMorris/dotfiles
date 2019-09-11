#!/usr/bin/env bash
sudo dpkg-query -f '${binary:Package}\n' -W > pkglistubuntu.txt
