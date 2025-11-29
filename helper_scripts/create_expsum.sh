#!/bin/bash

# This adds a list of experiment trials and thumbnails to the README.md
#  of each experiment to help navigation and visualisation

# set deploy to 0 when testing file generatrion locally
# set deploy to 1 for files uploaded to GitHub

deploy=1

# Nothing below this line to adapt

cwdir=`pwd`
autoline="<!-- Everything below this line is generated automatically, do not change -->"

trunc_README (){
    # Truncate old README
    awk "/$autoline/ {exit} {print}" README.md >ttt

    cat << EOF >> ttt
$autoline

---
---
---

> [!IMPORTANT]
> In the list of experiments below, click on the thumbnail to test - in your browser - the examples built by the LLMs.
> Clicking on the experiment name (left of thumbnail) brings you to the GitHub directory for
> the given experiment.

EOF



    cp ttt README.md
    rm ttt
}


list_these () {
    basedir=$1
    subdir=$2
    onlloc=$3
    game=$4
    gamefile=$5

    if [ $deploy -eq 0 ] ; then
        ghbase="."
        ghpages="."
    else
        ghbase="https://github.com/DrMicrobit/lllm_suit/blob/main"
        ghpages="https://drmicrobit.github.io/lllm_suit"
    fi

    echo "## $onlloc model experiments for $game" >>README.md
    echo >>README.md

    # Read NUL-separated results into an array (mapfile/readarray is safe and fast)
    mapfile -d '' -t files < <(
        find $subdir -type f -name $gamefile -print0 |
        sort -z
    )

    # Iterate with a for loop over array elements (preserves spaces)
    for file in "${files[@]}"; do
        ldir_path=$(dirname -- "$file")
        if [ $deploy -eq 0 ] ; then
            cdir_path=$ldir_path
        else
            cdir_path="$basedir/$ldir_path"
        fi
        echo $cdir_path


        thumb_path=$ldir_path/thumb.png
        # an existing game file, but empty means: complete failure
        # use the failure png as thumb for that
        if [ -f $ldir_path/$gamefile ]; then
            if [ ! -s $ldir_path/$gamefile ]; then
                thumb_path="./assets/complete_failure.png"
            fi
        fi

        cat << EOF >> README.md
### Experiment <a href="$ghbase/$cdir_path">$cdir_path</a>

<a href="$ghpages/$cdir_path/$gamefile">
  <img src="$thumb_path" style="vertical-align: middle;">
</a>

EOF
        # add annot.md to readme
        if [ -s $ldir_path/annot.md ] ; then
            cat $ldir_path/annot.md >> README.md
        else
            # convenience: create an annot.md if not existing
            touch $ldir_path/annot.md
        fi

        echo >>README.md

    done
}


newlist_these () {
    basedir=$1
    onlloc=$2
    gamename=$3
    gamefile=$4

    echo "$basedir $onlloc $gamename $gamefile"
}


go_through_expdirs() {
    fgamename="gamename.txt"
    fgamefile="gamefile.txt"

    # Read NUL-separated results into an array (mapfile/readarray is safe and fast)
    mapfile -d '' -t dirs < <(
        find tests/* -maxdepth 0 -type d -print0 |
        sort -z
    )

    for edir in "${dirs[@]}"; do
        echo $edir
        cd $edir
        if [ ! -s $fgamename ] ; then
            echo "Missing $fgamename in $edir"
            echo "Stopping $edir"
            exit
        fi
        if [ ! -s $fgamefile ] ; then
            echo "Missing $fgamefile in $edir"
            echo "Stopping $edir"
            exit
        fi

        gamename=`head -1 $fgamename`
        gamefile=`head -1 $fgamefile`

        trunc_README
        list_these $edir online Online "$gamename" "$gamefile"
        list_these $edir local Local "$gamename" "$gamefile"

        cd $cwdir
    done
}


go_through_expdirs
