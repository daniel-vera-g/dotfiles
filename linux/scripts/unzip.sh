#!/bin/bash
#Unzip all downloaded files

for f in ./* ; do
    echo "$f"
    if [[ -d $f ]]; then
    tar -xzvf $f/*.tgz -C $f/
    fi
done
