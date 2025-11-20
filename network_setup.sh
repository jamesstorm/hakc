#!/bin/bash

#HAKC_LAN="192.168.4.0/24" # local test on Stormnet
HAKC_LAN="192.168.2.0/24" # 461 Columbia 
TSAUTHKEY="tskey-auth-ku63akhsxp11CNTRL-1XAPEw4vsEVtXCs78ZSAEVSP1e4AK94J"

#echo $HAKC_LAN

#exit 1

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh


echo "net.ipv4.ip_forward=1" | sudo tee /etc/sysctl.d/99-ipforward.conf
sudo sysctl --system

sudo apt install -y iptables-persistent netfilter-persistent

sudo cp iptables.up.rules /etc/


sudo iptables-restore < /etc/iptables.up.rules
sudo netfilter-persistent save
sudo netfilter-persistent reload

sudo tailscale up \
  --authkey=$TSAUTHKEY \
  --advertise-routes=$HAKC_LAN \
  --accept-routes \
  --accept-dns=false



