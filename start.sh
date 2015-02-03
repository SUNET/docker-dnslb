#!/bin/bash

if [ "x$DNSDIR" = "x" ]; then
   DNSDIR="/etc/geodns"
fi

mkdir -p $DNSDIR && cd $DNSDIR && dnslb -z ${DNSDIR}/dns/${ZONE}.json -c ${DNSDIR}/${ZONE}.yaml
