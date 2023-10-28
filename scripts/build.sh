#!/bin/bash

cd $(dirname $0)/..

. pi/sources/poky/oe-init-build-env pi/build
bitbake core-image-minimal