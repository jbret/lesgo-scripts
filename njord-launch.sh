#!/bin/bash

# For launching lesgo jobs on njord cluster.
# Searches lesgo configuration file for number of MPI processes.
# Renames lesgo binary using a randomly generated integer ID.
# Launches MPI job.
#
# Author: Joel Bretheim

conf=lesgo.conf

nproc=`grep "nproc" $conf | awk '{print $3}'`

printf "Found nproc = $nproc in $conf \n"
echo $nproc

caseName="mycase"
rm $caseName*
myid=$RANDOM
range=1000
let "myid %= $range"
printf "Assigning job ID: $myid \n"
caseName="mycase"
caseName=$caseName$myid
cp lesgo-mpi-* $caseName

mpirun -np $nproc ./$caseName > lesgo.out &
