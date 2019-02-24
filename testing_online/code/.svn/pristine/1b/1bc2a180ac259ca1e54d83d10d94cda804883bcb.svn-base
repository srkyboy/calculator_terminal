#!/bin/bash


#if there is no folder make one
if [ ! -d "$BUILD_PATH" ]; then
	mkdir $BUILD_PATH
fi

#go there and BUILD
cd $BUILD_PATH
qmake $CODE_PATH
make $BUILD_TARGET