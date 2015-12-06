#!/bin/bash

if [ "$1" == "off" ] ; then
    GW=10.32.112.1
    route del default $GW
    route del default
    route add -net 10.0.0.0/8 gw $GW
fi
