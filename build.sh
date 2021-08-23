#!/bin/sh -ex
#

build() {

    tag=${1:-nginx}

    name=${2:-$tag}

    rm -rf webox-docker

    if [ ! -f $tag.tar.gz ]; then
        wget https://team.vmlu.com/git/open/webox-docker/archive/$tag.tar.gz
        tar xvf $tag.tar.gz
    fi

    docker build -t vmlu/webox:$name webox-docker

    docker push vmlu/webox:$name

}

rm *.tar.gz

build nginx

build nginx-php5.6
build nginx-php5.6 nginx-php5

build nginx-php7.3

build nginx-php7.4
build nginx-php7.4 nginx-php
build nginx-php7.4 nginx-php7

build nginx-php8.0
build nginx-php8.0 nginx-php8

build edge
build master latest
