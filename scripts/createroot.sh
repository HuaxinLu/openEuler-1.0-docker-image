#!/bin/bash
#mount iso file
mkdir -p /mnt/openEuler-1.0-1205-repo
mount -o loop openEuler-1.0-1205-aarch64-dvd.iso /mnt/openEuler-1.0-1205-repo/
#create root folder
mkdir /openEuler-1.0-1205-root
#init rpm environment
rpm --root /openEuler-1.0-1205-root/ --initdb
rpm --root /openEuler-1.0-1205-root/ -ivh /mnt/openEuler-1.0-1205-repo/Packages/openEuler-gpg-keys-1.0-2.2.aarch64.rpm
rpm --root /openEuler-1.0-1205-root/ -ivh /mnt/openEuler-1.0-1205-repo/Packages/openEuler-repos-1.0-2.2.aarch64.rpm
rpm --root /openEuler-1.0-1205-root/ -ivh /mnt/openEuler-1.0-1205-repo/Packages/openEuler-release-1.0-16.aarch64.rpm --force --nodeps
#init yum repo
#use the yum package from openEuler-1.0-aarch64-dvd.iso
#this can make the image smaller
mkdir -p /mnt/openEuler-1.0-repo
mount -o loop openEuler-1.0-aarch64-dvd.iso /mnt/openEuler-1.0-repo/
rm -f /openEuler-1.0-1205-root/etc/yum.repos.d/*.repo
cat >/openEuler-1.0-1205-root/etc/yum.repos.d/openEuler.repo<<EOF
[openEuler]
baseurl=file:///mnt/openEuler-1.0-repo
enabled=1
gpgcheck=0
EOF
#install yum
yum -y --installroot=/openEuler-1.0-1205-root/ install yum
