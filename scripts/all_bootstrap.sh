#!/bin/bash

#Bootstrapping basic software. Not all i needed on all nodes but KISS!
sudo apt-get update
sudo apt-get install ssh samba nfs-kernel-server nfs-common vsftpd 
