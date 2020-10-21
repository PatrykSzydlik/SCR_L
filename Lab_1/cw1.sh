#!/bin/bash
DATA=`date | cut -d ' ' -f 1`
echo $DATA
if [ DATA==Wed ]; then
    echo "Working day"
else
    echo "Not working day"
fi