#!/bin/bash

cd $(dirname $0)/..

if [[ -d pi/sources ]] ; then
    git -C pi/sources/poky pull
    git -C pi/sources/meta-raspberrypi pull
else 
    mkdir -p pi/sources
    git clone -b kirkstone git://git.yoctoproject.org/poky pi/sources/poky
    git clone -b kirkstone git://git.yoctoproject.org/meta-raspberrypi pi/sources/meta-raspberrypi
fi
mkdir -p pi/build/conf
cp conf/* pi/build/conf/
