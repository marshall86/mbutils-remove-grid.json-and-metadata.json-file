#! /bin/bash
while true; do
    read -p "Insert the tiles folder name " directory
    echo "Size of tiles folder: "; du $directory -chs | tail -n 1;
    echo "Size of all .json files to delete: "; find . -type f -name "*.json" -print0 | du -ch --files0-from=- | tail -n 1;
    read -p "Insert y for deleting .json files, insert n to exit " yn
    case $yn in
        [Yy]* ) find . -type f -name "*.json" -exec rm {} \;; break;;
        [Nn]* ) break;;
        * ) echo "You have to insert y or n.";;
    esac
done
