#!/bin/bash

# Call script with: ./borg-backup.sh [ARGS] 2>&1 | tee ~/Downloads/borg-backup.log

# Backup and repo locations add more dynamically
# TODO improve naming
export SYSTEM_BACKUP_LOCATION="/media/dvg/system-backups/borg-system-backup/"
export SYSTEM="/home/dvg/"
export ANDROID_BACKUP_LOCATION="/media/dvg/other-backups/borg-backups/android/"
export ANDROID="/home/dvg/Android/"
export DOWNLOAD_BACKUP_LOCATION="/media/dvg/other-backups/borg-backups/downloads/"
export DOWNLOAD="/home/dvg/Downloads/"
export EDU_BACKUP_LOCATION="/media/dvg/other-backups/borg-backups/edu/"
export EDU="/home/dvg/workspace/edu"
export NEOHELDEN_BACKUP_LOCATION="/media/dvg/other-backups/borg-backups/neohelden/"
export NEOHELDEN="/home/dvg/workspace/neohelden/"
export VM_BACKUP_LOCATION="/media/dvg/other-backups/borg-backups/VM/VM-backup-borg/"
export VM="/home/dvg/VirtualBox VMs/"

# Check for empty arguments list
if [ $# -eq 0 ]; then
  echo "No arguments provided, please specify backup location."
  exit 1
fi

# TODO better naming in functions

getBackupPath() {
  case "$1" in
    "system") echo $SYSTEM_BACKUP_LOCATION;;
    "android") echo $ANDROID_BACKUP_LOCATION;;
    "downloads") echo $DOWNLOAD_BACKUP_LOCATION;;
    "edu") echo $EDU_BACKUP_LOCATION;;
    "neohelden") echo $NEOHELDEN_BACKUP_LOCATION;;
    "vm") echo $VM_BACKUP_LOCATION;;
    *) echo "";;
  esac
}

getLocationToBackUp() {
  case "$1" in
    "system") echo $SYSTEM;;
    "android") echo $ANDROID;;
    "downloads") echo $DOWNLOAD;;
    "edu") echo $EDU;;
    "neohelden") echo $NEOHELDEN;;
    "vm") echo $VM;;
    *) echo "";;
  esac
}

# Loop through items to backup
for argval in "$@"
do

  # For each item get bakup location path
  location=$(getLocationToBackUp "$argval")

  # For each item get backup repo path and set env variable for borg
  repo=$(getBackupPath "$argval")
  export BORG_REPO=$repo

  # Check for bad parameter
  # TODO if parameter wrong continue to next
  [[ -z "$location" ]] || [[ -z "$repo" ]] && echo "Wrong parameter $argval, please check your input" && continue

  # Only if system backup use full excludefile
  exclude="/home/dvg/dotfiles/linux/shell/scripts/backup/system/BASIC_EXCLUDEFILE"
  if [ "$SYSTEM_BACKUP_LOCATION" == "$BORG_REPO" ]; then exclude="/home/dvg/dotfiles/linux/shell/scripts/backup/system/EXCLUDEFILE"; fi

  echo "Location to back up: $location"
  echo "Repo to back up: $repo"
  echo "Ignorefile: $exclude"

  # some helpers and error handling:
  info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
  trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

  info "Starting backup"
  
  # Backup the most important directories into an archive named after
  # the machine this script is currently running on:
  borg create                         \
    --verbose                       \
    --filter AME                    \
    --list                          \
    --progress                      \
    --stats                         \
    --show-rc                       \
    --compression lz4               \
    --exclude-caches                \
    --exclude '/home/*/node_modules/*' \
    --exclude-from "$exclude"    \
    ::"{hostname}-$argval-backup-{now}"            \
    "$location"
  
    backup_exit=$?
  
  info "Pruning repository: $BORG_REPO"
  
  # Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
  # archives of THIS machine. The '{hostname}-' prefix is very important to
  # limit prune's operation to this machine's archives and not apply to
  # other machines' archives also:
  
  borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6               \
  
    prune_exit=$?
  
  # use highest exit code as global exit code
  global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))
  
  if [ ${global_exit} -eq 0 ]; then
    info "Backup and Prune for $location finished successfully"
  elif [ ${global_exit} -eq 1 ]; then
    info "Backup and/or Prune for $location finished with warnings"
  else
    info "Backup and/or Prune for $location finished with errors"
  fi
  
  # exit ${global_exit}

done
