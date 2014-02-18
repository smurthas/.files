#!/bin/bash

backup_dir=$HOME/.files.bkp_`date +"%Y_%m_%d__%H_%M_%S"`
mkdir -p $backup_dir

FILES=`pwd`/scripts/.[a-z]*

for f in $FILES
do
  filename=`basename $f`
  home_filename=$HOME/$filename
  if [ -f $home_filename -o -d $home_filename ]
  then
    backup_filename=$backup_dir/$filename
    echo "Backing up $home_filename to $backup_filename"
    mv $home_filename $backup_filename
    echo "Installing $filename to $home_filename"
    cp -r $f $home_filename
  fi
done

echo done
