
export CRAY_ACC_DEBUG=2
export GCN_DEBUG=1

module load PrgEnv-gnu
#module load PrgEnv-cray
#module load PrgEnv-amd

module load craype-accel-amd-gfx90a
module load rocm
module load perftools-lite-gpu

make clean

#make
make ompapi.exe
#pat_build ./ompapi.exe


export LD_LIBRARY_PATH=${PWD}:${LD_LIBRARY_PATH}
./ompapi.exe
rm -f *.o *.mod

#python driver.py ${PWD}
#python -m cProfile -s tottime driver.py ${PWD} > prof_crusher.out

