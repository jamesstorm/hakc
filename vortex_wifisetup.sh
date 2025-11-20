#!/bin/bash



# Create the Stormnet connection
sudo nmcli connection add type wifi ifname wlan0 con-name Stormnet \
    ssid "Stormnet" \
    802-11-wireless-security.key-mgmt wpa-psk \
    802-11-wireless-security.psk "WonderMagicEquinox"

# Stormnet is an eeor network, so unlock the BSSID so it can roam freely
sudo nmcli connection modify Stormnet 802-11-wireless.bssid ""


# Create wifi connection for 461 Columbia
sudo nmcli connection add type wifi ifname wlan0 con-name BELL035 \
    ssid "BELL035" \
    802-11-wireless-security.key-mgmt wpa-psk \
    802-11-wireless-security.psk "54646215"

# restart the things!
sudo systemctl restart NetworkManager
