#!/bin/bash
2>/dev/null
eArray=()
name=$(whoami)
while [ -n "$1" ]
do
case "$1" in
-a)
archname="$2"
shift
;;
-f)
folder="$2"
if [ -d "./$folder" ]; then
echo "$folder already exist"
else
mkdir "$folder"
fi
touch "$folder/error_log.txt"
2>"$folder/error_log.txt"
shift
;;
-e)
while [ -n "$2" ]
do
eArray+=("*.$2")
shift
done
;;
*) echo "invalid option $1";;
esac
shift
done
IFS=$'\n'
for ext in ${eArray[@]};do
for fname in $(find "/home/$name/" -name $ext -type f);do
end_fname=$(basename $fname)
pth=$(echo $fname|sed "s/${end_fname}$//")
pth=$(echo $pth|sed "s/^\/home\/${name}\///")
if ! [ -d "$folder/$pth" ]; then
mkdir -p $folder/$pth
fi
cp $fname $folder/$pth/
done
done
tar -cf "$folder/$archname.tar" --exclude="$folder/$archname.tar" "$folder/" 
echo "Done!"
