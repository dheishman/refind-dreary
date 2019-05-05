#!/bin/sh

# -------------------------------------------------
#  Installation script for the refind-dreary theme
# -------------------------------------------------


RES="$1"
INSTALLER_DIR="$(dirname $(readlink -f $0))"
REFIND_DIR="$2"
DEST_DIR="${REFIND_DIR}/themes/refind-dreary"


# Exit when an error occurs
set -e
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

# Check the received arguments
if ! { [ "$RES" = "clover" -o "$RES" = "lowres" -o "$RES" = "highres" ]; }; then
    echo "Choose a proper theme version"
    exit 1
fi
if [ ! -d "$2" ]; then
    echo "Give a proper path for the rEFInd directory"
    exit 2
fi

# Check for previous installations
if [ -d "$DEST_DIR" ]; then
    read -p "refind-dreary is already installed, would you like to reinstall it[Y/n]?" answer
    if [ "$answer" = "Y" -o "$answer" = "y" ]; then
        rm -r "$DEST_DIR"
    else
        echo "Installation cancelled"
        exit 0
    fi
fi

# Copy the refind-dreary theme into the refind theme directory
mkdir -p $DEST_DIR
cp -r $INSTALLER_DIR/$RES/* $DEST_DIR

# Disable other themes
if [ -f "${REFIND_DIR}/refind.conf" ]; then
    sed -i -r "/^[[:space:]]*include[[:space:]]themes\/refind-dreary\/theme\.conf/!s/^([[:space:]]*)(include[[:space:]]themes\/)/\1# \2/g" "${REFIND_DIR}/refind.conf"
else
    touch "${REFIND_DIR}/refind.conf"
fi

# Include the refind-dreary theme
if ! grep -q -e "^[[:space:]]*include[[:space:]]themes/refind-dreary/theme.conf" "$REFIND_DIR/refind.conf"; then
cat >> "${REFIND_DIR}/refind.conf" << EOF

# Apply the refind-dreary theme
include themes/refind-dreary/theme.conf
EOF
fi

# Exit
echo "Succesfully installed refind-dreary"
exit 0
