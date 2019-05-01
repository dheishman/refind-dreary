#!/bin/sh

# Installation script for the refind-dreary theme

RES="$1"
REFIND_DIR="$2"
DEST_DIR="${REFIND_DIR}/themes/refind-dreary"


if ! { [ "$RES" = "clover" -o "$RES" = "lowres" -o "$RES" = "highres" ]; }; then
    echo "Choose a proper theme version"
    exit 1
fi
if [ ! -d "$2" ]; then
    echo "Give a proper path for the rEFInd directory"
    exit 2
fi


if [ -d "$DEST_DIR" ]; then
    read -p "refind-dreary is already installed, would you like to reinstall it[Y/n]?" answer
    if [ "$answer" = "Y" -o "$answer" = "y" ]; then
        rm -r "$DEST_DIR"
    else
        echo "Installation cancelled"
        exit 0
    fi
fi

mkdir -p $DEST_DIR
cp -r $RES/* $DEST_DIR

if [ -f "${REFIND_DIR}/refind.conf" ]; then
    sed -i -r "s/^([[:space:]]*)(include[[:space:]]themes\/)/\1# \2/g" "${REFIND_DIR}/refind.conf"
else
    touch "${REFIND_DIR}/refind.conf"
fi

cat >> "${REFIND_DIR}/refind.conf" << EOF

# Apply the refind-dreary theme
include themes/refind-dreary/theme.conf
EOF

echo "Succesfully installed refind-dreary"
