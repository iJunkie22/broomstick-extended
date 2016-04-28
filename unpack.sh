#!/bin/bash

mkdir "$HOME/Library/Application Support/Broomstick/" 2>/dev/null;

cd ./Listings/ && ls -1 | while read line; do cp "./$line" "$HOME/Library/Application Support/Broomstick/$line";echo "unpacked $line"; done

