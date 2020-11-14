#!/bin/bash
#
# generate random hostname (root cron)


# generate random number between 0 and 9
chance=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | head --bytes 1)


# select hostname prefix
if [[ $chance == 0 ]]; then
  prefix="Desktop"
fi

if [[ $chance == 1 ]]; then
  prefix="desktop"
fi

if [[ $chance == 2 ]]; then
  prefix="PC"
fi

if [[ $chance == 3 ]]; then
  prefix="pc"
fi

if [[ $chance == 4 ]]; then
  prefix="main"
fi

if [[ $chance == 5 ]]; then
  prefix="office"
fi

if [[ $chance == 6 ]]; then
  prefix="work"
fi

if [[ $chance == 7 ]]; then
  prefix="family"
fi

if [[ $chance == 8 ]]; then
  prefix="WORKSTATION"
fi

if [[ $chance == 9 ]]; then
  prefix="workstation"
fi


# generate random 16 character alphanumeric string (upper and lowercase)
hngen=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

# merge prefix and hostname
hn="$prefix-$hngen"
# echo $hn

# set hostname
hostnamectl set-hostname $hn

# set hostname in hosts to avoid hostname-error requiring logout
sed -i "1 s/^.*$/127.0.0.1    localhost $hn/" /etc/hosts
