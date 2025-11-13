#!/bin/bash

# This adds a list of experiments and thumbnails to the README.md
#  to help navigation and visualisation


list_these () {
    sdir=$1
    onlloc=$2
    game=$3

    ghbase="https://github.com/DrMicrobit/lllm_suit/blob/main"
    ghpages="https://drmicrobit.github.io/lllm_suit"

    echo "### $onlloc model experiments for $game" >>README.md
    echo >>README.md

    # Read NUL-separated results into an array (mapfile/readarray is safe and fast)
    mapfile -d '' -t files < <(
        find $sdir -type f -name 'thumb.png' -print0 |
        sort -z
    )

    # Iterate with a for loop over array elements (preserves spaces)
    for file in "${files[@]}"; do
        dir_path=$(dirname -- "$file")
        file_name=$(basename -- "$file")
        echo "Experiment <a href=\"$ghbase/$dir_path\">$dir_path</a> <a href=\"$ghpages/$dir_path/space_invaders.html\">" >>README.md
        echo "<img src=\"$dir_path/$file_name\" style=\"vertical-align: middle;\">" >>README.md
        echo "</a>" >>README.md
        echo >>README.md
    done
}

autoline="<!-- Everything below this line is generated automatically, do not change -->"


# Truncate old README

awk "/$autoline/ {exit} {print}" README.md >ttt
echo "$autoline" >>ttt
echo "" >>ttt
cp ttt README.md
rm ttt




list_these ./tests/SpaceInvaders/local "Local" "Space Invaders"
list_these ./tests/SpaceInvaders/online "Online" "Space Invaders"
 