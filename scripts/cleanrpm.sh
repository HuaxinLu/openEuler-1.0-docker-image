#!/bin/bash
#set yum and bash protected
rm -f /etc/yum/protected.d/*
echo yum >>/etc/yum/protected.d/yum.conf
echo bash >>/etc/yum/protected.d/bash.conf
#remove other packages
for line in $(rpm -qa); do
	yum remove -y $line
done
#change the yum repo
rm -f /etc/yum.repos.d/*.repo
cat >/etc/yum.repos.d/openEuler.repo<<EOF
[openeuler1]
name=mainline
baseurl=http://119.3.219.20:8080/Mainline/standard_aarch64/
enabled=1
gpgcheck=0

[openeuler2]
name=extras
baseurl=http://119.3.219.20:8080/Extras/standard_aarch64/
enabled=1
gpgcheck=0
EOF
#download vim
yum install -y vim
yum clean all
