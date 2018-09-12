#/bin/bash

DIRS="pyday pycon smalltalks jaiio cacic"
TEMPLATE="DSC%05d.jpg"
BASEDIR="$PWD"

mkdir -p $DIRS
for dir in $DIRS; do
    cd "$dir"
    index=$(expr $RANDOM \% 5000)
    amount=$(expr $RANDOM \% 10 + 5)
    for i in $(seq $amount); do
        touch $(printf "$TEMPLATE" $index)
        let index++
    done
    cd "$BASEDIR"
done
