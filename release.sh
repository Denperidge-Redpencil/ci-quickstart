#!/bin/bash

mkdir -p .release

for dir in */
do
    name="${dir%/}"
    echo $name
    tar -czvf ".release/$name.tar.gz" "$dir"
done

