#!/bin/bash

cat > /etc/network/interfaces <<EOL
auto eth0
iface eth0 inet static
  address 192.168.201.2
  netmask 255.255.255.0
  gateway 192.168.201.1
EOL
