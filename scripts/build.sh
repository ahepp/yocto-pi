#!/bin/bash

cd $(dirname $0)/..

. pi/sources/poky/oe-init-build-env pi/build
bitbake-layers add-layer \
  ../sources/poky/meta \
  ../sources/poky/meta-poky \
  ../sources/poky/meta-yocto-bsp \
  ../sources/meta-raspberrypi
bitbake core-image-minimal
