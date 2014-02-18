#!/bin/bash

backup_dir=$HOME/.files.bkp_`date +"%Y_%m_%d__%H_%M_%S"`
mkdir -p $backup_dir

FILES=`pwd`/scripts/.[a-z]*

for f in $FILES
do
  filename=`basename $f`
  home_filename=$HOME/$filename

  # if it exists already, back it up
  if [ -f $home_filename -o -d $home_filename ]
  then
    backup_filename=$backup_dir/$filename
    echo "Backing up $home_filename to $backup_filename"
    mv $home_filename $backup_filename
  fi

  # install the new file
  echo "Installing $filename to $home_filename"
  cp -r $f $home_filename
done

echo "Emojifying..."
TMP_DIR=/tmp/psemoji
if [ -d $TMP_DIR ]
then
  rm -rf $TMP_DIR
fi

git clone https://github.com/smurthas/psemoji.git $TMP_DIR
# install it
$TMP_DIR/👍

echo
echo Done!

source $HOME/.profile
