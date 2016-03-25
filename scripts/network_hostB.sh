#!/bin/bash

cat > /etc/network/interfaces <<EOL
auto eth0
iface eth0 inet static
  address 192.168.200.1
  netmask 255.255.255.0
EOL


cat > /etc/network/interfaces <<EOL
auto eth1
iface eth1 inet static
  address 192.168.201.1
  netmask 255.255.255.0
EOL
