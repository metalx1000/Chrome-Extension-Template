#!/bin/bash

tmpf="/tmp/$RANDOM.zip"

zip="https://github.com/metalx1000/Chrome-Extension-Template/archive/master.zip"
echo "Downloading Template..."
wget "$zip" -O "$tmpf"

unzip "$tmpf"

#enter manifest info
echo -n "Extension Name: "
read name
mv "Chrome-Extension-Template-master" "$name" || (echo "Error creating folder"; rm "$tmpf";exit 1)
cd "$name"
sed -i "s/#name#/$name/g" manifest.json
 
echo -n "Effected url: "
read url
sed -i "s~#url#~$url~g" manifest.json

echo -n "Extension Description: "
read description
sed -i "s/#description#/$description/g" manifest.json

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

echo "Clean up..."
rm "$tmpf"

vim manifest.json

echo "Project is in folder $name"
