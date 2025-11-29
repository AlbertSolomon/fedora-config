#!/bin/bash

ZIPDIR="$HOME/Downloads/zip_files"
mkdir -p "$ZIPDIR"

if [ -d $ZIPDIR ]; then
    mv ~/Downloads/*.tar ~/Downloads/*.rar ~/Downloads/*.zip $ZIPDIR
else
    cd ~/Downloads && mkdir -p zip_files
    mv -r *.tar *.zip *.rar zip_files
fi
    
