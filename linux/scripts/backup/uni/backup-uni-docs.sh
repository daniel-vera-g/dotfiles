#!/bin/bash

currDate=$(date +"%Y-%m-%d")
toBackupPath="/home/dvg/workspace/edu/uni"
backupPath="/home/dvg/sync/notebook/projects/education/uni/repo-backup"
backupCount=$(ls ~/sync/notebook/projects/education/uni/repo-backup/ | wc -l)

# Create destination directory
echo "----------------------------------------------------------"
echo "Creating directory for uni backup: $backupPath/$currDate" 
mkdir $backupPath/$currDate
echo "----------------------------------------------------------"

for I in $(ls ~/workspace/edu/uni/); do
    # Create backup
    echo "----------------------------------------------------------"
    echo "Creating backup for $toBackupPath/$I"
    echo "tar cJvf $backupPath/$currDate/$I.tar.xz $toBackupPath/$I"
    tar -cJvf $backupPath/$currDate/$I.tar.xz $toBackupPath/$I
    echo "----------------------------------------------------------"
done

# Clean up 5th oldest backup
echo $backupCount
if (($backupCount > 5)); then
    # Get last backup item and remove it
    echo "----------------------------------------------------------"
    echo "Removing $(ls ~/sync/notebook/projects/education/uni/repo-backup/ | head -n 1)"
    rm -ivrf $backupPath/$(ls $backupPath | tail -n 1)
    echo "----------------------------------------------------------"
fi



