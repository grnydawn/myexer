

module load PrgEnv-gnu
#module load PrgEnv-cray
#module load PrgEnv-amd

module load craype-accel-amd-gfx90a
module load rocm
#module load perftools-lite-gpu

make clean

make
#make ompapi.exe
#pat_build ./ompapi.exe

rm -f *.o *.mod

#./ompapi.exe > prof_crusher.out
#python driver.py ${PWD}
python -m cProfile -s tottime driver.py ${PWD} > prof_crusher.out

