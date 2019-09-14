#!/bin/sh
#

apt update
apt upgrade -y

apt install -y apt-utils
apt install -y iputils-ping vim wget cron

apt install -y openssh-server
sed -ri 's/^UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

rm -rf /var/log/*.log
rm -rf /var/log/apt/*.log
rm -rf /var/lib/apt/lists/*

rm -rf /usr/bin/setup.sh
