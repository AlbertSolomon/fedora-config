#!/bin/bash

ZIPDIR="$HOME/Downloads/zip_files"
mkdir -p "$ZIPDIR"

if [ -d $ZIPDIR ] then;
    mv -t ~/Downloads/*.tar ~/Downloads/zip_files ~/Downloads/*.zip $ZIPDIR
else
    cd ~/Downloads && mkdir -p zip_files
    mv -r ~/Downloads/*.tar zip_files ~/Downloads/*.zip zip_files
fi
    
