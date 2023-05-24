#!/bin/sh
# This file need to be run as super user to work
ALICE_NET="10.0.0.0/24"
ALICE="10.0.0.2"

BOB_NET="10.1.0.0/24"
BOB="10.1.0.2"


# Connect Alice with Bob
iptables -I FORWARD -s $ALICE -d $BOB -j ACCEPT
iptables -I FORWARD -s $BOB -d $ALICE -j ACCEPT
