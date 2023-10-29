# pi

A containerized yocto project intended for use with the raspberry pi

## To build

    $ docker build . -t $PI_IMAGE
    $ docker run -it -w /ws -v $(pwd):/ws -v $PI_VOLUME:/ws/pi $PI_IMAGE
    > ./scripts/fetch.sh
    > ./scripts/build.sh
