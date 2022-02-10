

module load craype-accel-amd-gfx908
module load rocm
module load perftools-lite-gpu
make clean
make
#pat_build -u -g mpi ./ompapi.exe
./ompapi.exe
