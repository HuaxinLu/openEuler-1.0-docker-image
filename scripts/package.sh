#!/bin/sh
mkdir -p /root/openeuler-build
cd /openEuler-1.0-1205-root
tarfile=../root/openeuler-build/rootfs.tar
tar -cvf $tarfile \
       --exclude=proc \
       --exclude=sys \
       --exclude=mnt \
       --exclude=var/cache \
       --exclude=usr/share/{perl5,fonts,groff,icons,X11,doc,info,themes,color,colord,locale} \
       --exclude=usr/src \
       --exclude=var/log \
       --exclude=*.sh \
       ./*
