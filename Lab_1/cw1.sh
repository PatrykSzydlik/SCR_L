#!/bin/bash
DATA=`date | cut -d ' ' -f 1`
echo $DATA
if [ $DATA == Sat ] || [ $DATA == Sun ] 
then
    echo "It's Weekend!"
else
    echo "Another working day"
fi