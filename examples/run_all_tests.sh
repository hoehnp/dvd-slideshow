#!/bin/bash

start_cpu_time=$( date +%s )

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

cd '0.7.5'
sh runtest.sh $*
cd ..

cd '0.8.0'
sh runtest.sh $*
cd ..

cd cool
sh runtest.sh $*
cd ..

end_cpu_time=$( date +%s )
total_cpu_time="$(( $end_cpu_time - $start_cpu_time ))"

echo "Total runtime for all tests was $total_cpu_time seconds"


