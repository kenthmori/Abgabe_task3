#!/bin/bash

make -f ./makefile

export LD_LIBRARY_PATH=/.:${LD_LIBRARY_PATH}

./main_stat.x
./main_dyn.x

