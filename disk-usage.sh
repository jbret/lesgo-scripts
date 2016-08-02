#!/bin/bash

# Determines disk usage of each directory in ./ and writes
# output to file with the date. The 'du' command will take
# a few minutes to complete, depending on amount of data
# in ./
#
# Author: Joel Bretheim

uno='DISK-USAGE-'
dos=`date +"%Y-%m-%d"`
tre='.txt'
fileName=$uno$dos$tre

printf "\nWriting output to: $fileName \n"

du -BG --max-depth=1 > $fileName &

printf "Calculating... check file in a few minutes... \n\n"
