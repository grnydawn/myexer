
#If invoking amdclang, amdclang++, or amdflang directly, or using hipcc
# you will need to add: -fopenmp -target x86_64-pc-linux-gnu
#       -fopenmp-targets=amdgcn-amd-amdhsa -Xopenmp-target=amdgcn-amd-amdhsa -march=gfx90a.


OMPFC := ftn
OMPOPT := -fopenmp

slib: libapi.so kernel.so

ompapi.exe: ompapi.F90 libapi.so kernel.so
	${OMPFC} ${OMPOPT} -fPIC -o $@ $^

libapi.so: libapi.F90
	${OMPFC} -shared -fPIC ${OMPOPT} -o $@ $<

kernel.so: kernel.F90
	${OMPFC} -shared -fPIC ${OMPOPT} -o $@ $<

clean:
	rm -rf *.exe *.o *.s *.mod core *.exe+* *.out *.so
