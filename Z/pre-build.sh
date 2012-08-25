#!/bin/bash
zmq_version="2.2.0"

# Installing the zeromq library if it hasn't been yet.
# No system package for zeromq in Lucid :(
echo "# Checking for ZeroMQ presence"
test -f ~/.zmq_installed || (
    echo "# Installing zeromq-2.2.0"
    mkdir -p /home/dotcloud/installs/zeromq
    mkdir builds && cd builds
    wget http://download.zeromq.org/zeromq-2.2.0.tar.gz
    tar -xvf zeromq-2.2.0.tar.gz
    cd zeromq-2.2.0
    ./configure --prefix=/home/dotcloud/installs/zeromq; make; make install
    cd ../..
    rm -rf builds
    touch ~/.zmq_installed
)

echo "# Exporting PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/home/dotcloud/installs/zeromq/lib/pkgconfig:$PKG_CONFIG_PATH"
echo ${PKG_CONFIG_PATH}
ls /home/dotcloud/installs/zeromq/lib

