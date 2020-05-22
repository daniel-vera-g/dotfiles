#!/bin/bash
#############################################################
# Programm to bundle, compress and encrypt information
# for the use as backup
#############################################################

# Date for the backup
DATE=`date +%y.%m.%d`
echo "$DATE"
# Array of the folders to backup
FOLDER1=$1
echo $FOLDER1
FOLDER2=$2
echo $FOLDER2

declare -a arr=($FOLDER1 $FOLDER2)
# Create backup directory
mkdir -p ./$DATE
 
# Loop through array of folders and backup:
# 1. Bundle = tar
# 2. Compress = xz
# 3. Encrypto = enc(aes256)
echo "Will start process"
for i in "${arr[@]}"
do
	echo "$i"
	tar cJ "$i" | openssl enc -aes256 -e -out ./$DATE/"$i".tar.xz.enc
done 
echo "Process done"
