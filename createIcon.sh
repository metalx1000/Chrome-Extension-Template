#!/bin/bash

#create icon
echo -n "Icon File: "
read icon

#if icon file exists create needed sizes
if [ -f "$icon" ]
then
  echo "Creating icons..."
  sizes=( 16 48 128 256 )
  for i in "${sizes[@]}"
  do
    convert $icon -resize "${i}x${i}" icon${i}.png 
  done
else
  echo "No icon file found..."
fi


