#!/usr/bin/env bash

# Get file information
INPUT_FILENAME=$1
FILEPATH=$(dirname $INPUT_FILENAME)
FILENAME=$(basename $INPUT_FILENAME)
FILETYPE=${FILENAME##*.}

# Source and public paths
SOURCE="source_$FILEPATH/$FILENAME"
TARGET="$FILEPATH/$FILENAME"

# Does image have a specified output size?
# If it does, it should end in "-[width]x[height].[jpg or png]"
# Both fields are optional
# Examples:
#	banner.jpg > no resizing
#	banner-960.jpg > resize to width of 960px, keep aspect ratio
#	banner-x100.jpg > resize to height of 100px, keep aspect ratio
#	banner-800x100.jpg > resize to width of 800px, height of 100px
#
# If not, let's make sure we don't publish something with a dimension
# greater than 1600 as a general safety.
SIZE=$(echo ${FILENAME%.*} | egrep -o '\-([[:digit:]]*x?[[:digit:]]+)$')
SIZE=${SIZE:1}
if [[ -z $SIZE ]]; then
	SIZE="-resize 1600>"
else
	SIZE="-resize $SIZE"
fi

# PNGs are optimized with PNGCRUSH
# JPGs with JPEGOPTIM
# Otherwise we don't have an optimizer
if [[ "png" == $FILETYPE ]]; then
	convert "$SOURCE" $SIZE "$TARGET" > /dev/null 2>&1
	pngcrush -rem allb -brute -reduce -ow -s "$TARGET"
elif [[ "jpg" == $FILETYPE ]]; then
	convert "$SOURCE" $SIZE -quality 100 "$TARGET" > /dev/null 2>&1
	jpegoptim -m85 -s --all-progressive "$TARGET" > /dev/null 2>&1
else
	cp "$SOURCE" "$TARGET"
fi

# Get file sizes in a portable way and trim whitespace
BEFORE_SIZE=$(wc -c < $SOURCE | xargs)
AFTER_SIZE=$(wc -c < $TARGET | xargs)

# Sometimes we can't beat the originals
# If this is so, just copy the source
if (( $AFTER_SIZE >= $BEFORE_SIZE )); then
	cp "$SOURCE" "$TARGET"
	AFTER_SIZE=$BEFORE_SIZE
fi

# Report on the optimization
REDUCTION=$((100*$AFTER_SIZE/$BEFORE_SIZE))
echo "Optimized $FILENAME - $BEFORE_SIZE --> $AFTER_SIZE bytes ($REDUCTION%)"