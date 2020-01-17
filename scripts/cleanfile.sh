#!/bin/bash
#remove the unused locale
rm -f /usr/lib/locale/locale-archive*
localedef --list-archive |egrep -v ^"en_US|zh" |xargs localedef --delete-from-archive
cd /usr/include
ls | grep -v python3.7m | xargs rm -rf
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
