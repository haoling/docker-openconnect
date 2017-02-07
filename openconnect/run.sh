#!/bin/bash

echo "Firewall rules"
iptables -D FORWARD -i tun0 -j ACCEPT
iptables -D FORWARD -o tun0 -j ACCEPT
iptables -I FORWARD -i tun0 -j ACCEPT
iptables -I FORWARD -o tun0 -j ACCEPT
iptables -t nat -D POSTROUTING -o tun0 -j MASQUERADE
iptables -t nat -I POSTROUTING -o tun0 -j MASQUERADE

echo "Starting openconect"
echo "${PASSWORD}" | /usr/sbin/openconnect --passwd-on-stdin --no-cert-check $@
