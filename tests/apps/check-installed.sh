#!/bin/sh

app=$1

# dpkg -l | grep -E '^ii' | grep $1 | head -n 1
which $1