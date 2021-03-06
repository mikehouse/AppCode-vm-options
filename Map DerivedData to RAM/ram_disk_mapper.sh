#!/bin/bash

VOLUME_NAME=ramdisk
VOLUME_ROOT=/Volumes/$VOLUME_NAME

if [ ! -d "$VOLUME_ROOT" ]; then
	diskutil erasevolume HFS+ $VOLUME_NAME `hdiutil attach -nomount ram://24000000` # 12.35 GB DISC SIZE
fi

XCODE_DERIVED_DATA_RAM_PATH=/Volumes/$VOLUME_NAME/Xcode/DerivedData

if [ ! -d "$XCODE_DERIVED_DATA_RAM_PATH" ]; then
	mkdir -p "$XCODE_DERIVED_DATA_RAM_PATH"
fi

XCODE_DERIVED_DATA_ORIGIN_PATH=~/Library/Developer/Xcode/DerivedData

if [ ! -L "$XCODE_DERIVED_DATA_ORIGIN_PATH" ]; then
	if [ -d "$XCODE_DERIVED_DATA_ORIGIN_PATH" ]; then
		rm -fr "$XCODE_DERIVED_DATA_ORIGIN_PATH"
	fi	
	ln -s "$XCODE_DERIVED_DATA_RAM_PATH" "$XCODE_DERIVED_DATA_ORIGIN_PATH"
fi

# AppCode Support

for ver in "2019.1" "2019.2" "2019.3"; do
    APPCODE_VERSION=$ver
    APPCODE_ROOT=~/Library/Caches/AppCode$APPCODE_VERSION

    if [ -d "$APPCODE_ROOT" ]; then

        APPCODE_DERIVED_DATA_RAM_PATH=/Volumes/$VOLUME_NAME/$APPCODE_VERSION/DerivedData

        if [ ! -d "$APPCODE_DERIVED_DATA_RAM_PATH" ]; then
            mkdir -p "$APPCODE_DERIVED_DATA_RAM_PATH"
        fi


        APPCODE_DERIVED_DATA_ORIGIN_PATH=$APPCODE_ROOT/DerivedData

        if [ ! -L "$APPCODE_DERIVED_DATA_ORIGIN_PATH" ]; then
            if [ -d "$APPCODE_DERIVED_DATA_ORIGIN_PATH" ]; then
                rm -fr "$APPCODE_DERIVED_DATA_ORIGIN_PATH"
            fi	
            ln -s "$APPCODE_DERIVED_DATA_RAM_PATH" "$APPCODE_DERIVED_DATA_ORIGIN_PATH"
        fi

    fi
done

for ver in "2020.1" "2020.2" "2020.3" "2021.1" "2021.2"; do
    APPCODE_VERSION=$ver
    APPCODE_ROOT=~/Library/Caches/JetBrains/AppCode$APPCODE_VERSION

    if [ -d "$APPCODE_ROOT" ]; then

        APPCODE_DERIVED_DATA_RAM_PATH=/Volumes/$VOLUME_NAME/$APPCODE_VERSION/DerivedData

        if [ ! -d "$APPCODE_DERIVED_DATA_RAM_PATH" ]; then
            mkdir -p "$APPCODE_DERIVED_DATA_RAM_PATH"
        fi


        APPCODE_DERIVED_DATA_ORIGIN_PATH=$APPCODE_ROOT/DerivedData

        if [ ! -L "$APPCODE_DERIVED_DATA_ORIGIN_PATH" ]; then
            if [ -d "$APPCODE_DERIVED_DATA_ORIGIN_PATH" ]; then
                rm -fr "$APPCODE_DERIVED_DATA_ORIGIN_PATH"
            fi	
            ln -s "$APPCODE_DERIVED_DATA_RAM_PATH" "$APPCODE_DERIVED_DATA_ORIGIN_PATH"
        fi
        
    fi
done
