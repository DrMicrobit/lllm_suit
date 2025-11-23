#!/bin/bash

# When running experiments, I take a couple of screenshots
#  which are saved as "Screenshot from YYYY-MM-DD HH:MM:SS.png" by my
#  screen capturing software and put into the corresponding directory.
#
# This script
#  - takes the latest screenshot
#  - renames it to "Screenshot.png"
#  - creates a thumbnail "thump.png" with 250 pixel width


tpath=`pwd`


# Read NUL-separated results into an array (mapfile/readarray is safe and fast)
mapfile -d '' -t files < <(
    find tests -type f -name 'Screenshot*.png' -print0 |
    sort -z
)

# Iterate with a for loop over array elements (preserves spaces)
for file in "${files[@]}"; do
    dir_path=$(dirname -- "$file")
    file_name=$(basename -- "$file")
    echo "Path: $dir_path"
    echo "File: $file_name"
    cd $dir_path
    if [[ "$file_name" != "Screenshot.png" ]] ; then
        echo "Must rename $file_name"
        mv "$file_name" Screenshot.png
    fi
    if [ ! -e thumb.png ]; then
        convert Screenshot.png -resize 250x thumb.png
    fi
    cd $tpath
    echo "--------------------"
done
