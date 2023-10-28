# pi

A containerized yocto project intended for use with the raspberry pi

## To build with Codespaces

Spin up a codespace for the repository, then run

    $ ./scripts/fetch.sh
    $ ./scripts/build.sh

## To build with Docker

I haven't had a chance to test this out since adding codespace support.
Feedback is appreciated.

    $ docker build . -t $PI_IMAGE
    $ docker run -it -w /ws -v $(pwd):/ws -v $PI_VOLUME:/ws/pi $PI_IMAGE
    > ./scripts/fetch.sh
    > ./scripts/build.sh
