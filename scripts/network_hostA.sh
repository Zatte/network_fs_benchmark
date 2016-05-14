#!/bin/bash

cat > /etc/network/interfaces <<EOL
auto eth0
iface eth0 inet static
  address 192.168.200.2
  netmask 255.255.255.0
  gateway 192.168.200.1
EOL

route add -net 192.168.201.0 netmask 255.255.255.0 gw 192.168.200.1 dev eth1
