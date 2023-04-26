#!/bin/bash -l 

url=https://developer.nvidia.com/blog/wp-content/uploads/2019/11/OptiX-API.png
nam=$(basename $url)

if [ ! -f "$nam" ]; then 
   cmd="curl -L -O $url"
else
   cmd="echo url $url already downloaded to $nam " 
fi 

echo $cmd
eval $cmd




