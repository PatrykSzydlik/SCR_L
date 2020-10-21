#!/bin/bash

# oczekiwane wywołanie 
# ./cw3.sh NAME N TAR_NAME

NAME=$1
N=$2
TAR_NAME=$3

echo "find $HOME -mtime +$N -name "$NAME" -print0 | tar -cvf ./TAR_NAME --null -T - "
find $HOME -mtime +$N -name "$NAME" -print0 | tar -cvf ./$TAR_NAME.tar --null -T - 