#!/bin/bash

cd $(dirname $0)/..

. /ws/pi/sources/poky/oe-init-build-env /ws/pi/build
bitbake core-image-minimal
