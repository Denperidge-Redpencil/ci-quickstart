#!/bin/bash

select extract in emberjs python
do
    curl -O https://github.com/Denperidge-Redpencil/ci-quickstart/releases/latest/download/$extract.tar.gz
    tar -xzf $extract.tar.gz

    for file in $(find $extract -name "*.yml")
    do
        read -p "Enable ${file#$extract/}? [Y/n] " enable
        case $enable in
            [Nn]*) rm $file ;;
        esac
    done
done