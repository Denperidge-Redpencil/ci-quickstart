#!/bin/bash

select type in emberjs python
do
    mkdir -p /tmp/ci-quickstart/
    tar=/tmp/ci-quickstart/$type.tar.gz
    
    curl -L -o $tar https://github.com/Denperidge-Redpencil/ci-quickstart/releases/latest/download/$type.tar.gz
    tar -xzf $tar -C /tmp/ci-quickstart/

    for file in $(find /tmp/ci-quickstart -name "*.yml")
    do
        read -p "Enable ${file#$type/}? [Y/n] " enable
        case $enable in
            [Nn]*) rm $file ;;
        esac
    done

    rm $tar

    mkdir -p .woodpecker
    mv /tmp/ci-quickstart/*/* .woodpecker/

    rmdir /tmp/ci-quickstart/*
    rmdir /tmp/ci-quickstart/
    
    break
done