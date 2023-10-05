#!/bin/bash

select type in emberjs python
do
    tmpci=/tmp/ci-quickstart
    tar=$tmpci/$type.tar.gz

    rm -rf $tmpci
    mkdir -p $tmpci
    
    #cp .release/$type.tar.gz $tmpci
    curl -L -o $tar https://github.com/Denperidge-Redpencil/ci-quickstart/releases/latest/download/$type.tar.gz
    tar -xzf $tar -C $tmpci

    for file in $(find $tmpci -name "*.yml")
    do
        read -p "Enable ${file#$tmpci/$type/}? [Y/n] " enable
        case $enable in
            [Nn]*) rm $file ;;
        esac
    done

    rm $tar

    mkdir -p .woodpecker
    mv $tmpci/*/* .woodpecker/

    rm -rf $tmpci
    
    break
done