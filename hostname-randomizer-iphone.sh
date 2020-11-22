#!/bin/bash
#
# generate random hostname with "-iPhone" suffix (root cron)


name=$(sort -R hostnames.txt | head -1)
suffix="-iPhone"


# generate random number between 0 and 9
chance=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | head --bytes 1)

# append s sometimes
if [[ $chance -lt 6 ]]
then
  hn="$name$suffix"
else
  hn="${name}s$suffix"
fi


# hn="$name$suffix"

# set hostname
sudo hostnamectl set-hostname $hn

# set hostname in hosts to avoid hostname-error requiring logout
sudo sed -i '1d' /etc/hosts
sudo sed -i "1i 127.0.0.1    localhost $hn" /etc/hosts
