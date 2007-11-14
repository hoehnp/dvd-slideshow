#!/bin/bash

cd very_simple
sh runtest.sh $*
cd ..

cd simple
sh runtest.sh $*
cd ..

cd audio
sh runtest.sh $*
cd ..

cd complex
sh runtest.sh $*
cd ..

cd "complete"
sh runtest.sh $*
cd ..

cd 0.7.5
sh runtest.sh $*
cd ..

cd 0.8.0
sh runtest.sh $*
cd ..

