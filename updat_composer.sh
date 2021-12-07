#!/bin/bash
# Usage: update_composer.sh Folder
# Example local folder: update_composer.sh .

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters. Usage:  update_composer.sh Folder"
    exit 1
fi

READLINK="/bin/readlink"
STAT="/usr/bin/stat"
SU="/bin/su"
PHP="/usr/bin/php"

PATH=$($READLINK -f $1)
USERNAME=$($STAT -c '%U' $PATH)

echo "Update Composer in path $PATH"
echo "Update with User $USERNAME"

$SU -l $USERNAME -s /bin/bash -c "cd $PATH; $PHP composer.phar install"
