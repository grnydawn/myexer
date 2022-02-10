
module load python
module load pgi
module load cuda

make clean

make
#make ompapi.exe
#pat_build ./ompapi.exe


#export LD_LIBRARY_PATH=${PWD}:${LD_LIBRARY_PATH}
#./ompapi.exe

rm -f *.o *.mod

#python driver.py ${PWD}
#python -m cProfile -s tottime driver.py ${PWD} > prof_summit.out
pgprof python driver.py ${PWD}

