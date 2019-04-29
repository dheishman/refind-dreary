#!/bin/sh

# Installation script for the refind-dreary theme

destFolder="../themes/refind-dreary"


if ! { [ "$1" = "clover" -o "$1" = "lowres" -o "$1" = "highres" ]; }; then
    echo "Choose a proper theme version"
    exit 1
fi

if [ -d "$destFolder" ]; then
    echo "refind-dreary is already installed, would you like to reinstall it[Y/n]?"
    read answer
    if [ "$answer" = "Y" -o "$answer" = "y" ]; then
        rm -r "$destFolder"
    else
        echo "Installation cancelled"
        exit
    fi
fi
mkdir -p $destFolder
cp -r $1/* $destFolder
sed -i -r "s/^[[:space:]]?include[[:space:]]themes\//# include themes\//g" ../refind.conf
cat >> ../refind.conf << EOF

# Apply the refind-dreary theme
include themes/refind-dreary/theme.conf
EOF

echo "Succesfully installed refind-dreary"
