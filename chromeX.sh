#!/bin/bash



#enter manifest info
echo -n "Extension Name: "
read name
sed -i "s/#name#/$name/g" manifest.json

echo -n "Effected url: "
read url
sed -i "s/#url#/$url/g" manifest.json

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

vim manifest.json
