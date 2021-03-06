#!/usr/bin/with-contenv bash
set -e

bashCmd='bash -e'
if [ "${PH_VERBOSE:-0}" -gt 0 ] ; then 
    set -x ;
    bashCmd='bash -e -x'
fi

# used to start dnsmasq here for gravity to use...now that conflicts port 53

$bashCmd /start.sh
gravity.sh

# Kill dnsmasq because s6 won't like it if it's running when s6 services start
kill -9 $(pgrep pihole-FTL) || true
