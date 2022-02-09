

module load craype-accel-amd-gfx90a
module load rocm
module load perftools-lite-gpu
make clean
make
#pat_build -u -g mpi ./ompapi.exe
pat_build ./ompapi.exe
./ompapi.exe > prof_crusher.out

