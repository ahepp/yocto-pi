#!/bin/bash

cd $(dirname $0)/..

if [[ -d /ws/pi/sources ]] ; then
    git -C /ws/pi/sources/poky pull
    git -C /ws/pi/sources/meta-raspberrypi pull
else 
    mkdir -p /ws/pi/sources
    git clone -b kirkstone git://git.yoctoproject.org/poky     /ws/pi/sources/poky
    git clone -b kirkstone git://git.yoctoproject.org/meta-raspberrypi  /ws/pi/sources/meta-raspberrypi
fi
mkdir -p /ws/pi/build/conf
cp conf/* /ws/pi/build/conf/
