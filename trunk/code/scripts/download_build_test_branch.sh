#!/bin/bash

echo Please enter path for local folder
read folder_name

echo Please enter branch
read branch_name

if [ ! -d "$folder_name" ]; 
then
	mkdir $folder_name
else
	rm -rf $folder_name
	mkdir $folder_name	
fi

cd $folder_name

mkdir code
cd code
svn checkout $branch_name .

source init.sh

./scripts/build.sh
./scripts/test.sh