#!/bin/bash

set -euo pipefail

[ $# -eq 0 ] && echo "Parameter missing. Usage: $0 filename.mkv" && exit -1

MKV_INPUT="$1"
IFILE=$(basename "$MKV_INPUT")
# extension="${FILE##*.}"
IFILE="${IFILE%.*}"

# get E-AC3 audio track ID from MKV container
LINE=$(LANG=C mkvinfo ${MKV_INPUT} | grep "Track type" | grep -n "audio" | cut -d":" -f1)
AUDIO_ID=$(( $LINE - 1 ))

# extract E-AC3 audio track from MKV container
mkvextract tracks "$MKV_INPUT" ${AUDIO_ID}:"${IFILE}.eac3"

# convert E-AC3 audio file to a standart AC3 file
avconv -i "${IFILE}.eac3" -c:a ac3 "${IFILE}.ac3" -b 600k
