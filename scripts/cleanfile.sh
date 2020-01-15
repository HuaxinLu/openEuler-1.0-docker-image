#!/bin/bash
#remove the unused locale
rm -f /usr/lib/locale/locale-archive*
localedef --list-archive |egrep -v ^"en_US|zh" |xargs localedef --delete-from-archive
