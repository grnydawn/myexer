

OMPFC ?= ftn
#OMPOPT ?= -h omp,noacc
#OMPFC := gfortran
OMPOPT := -fopenmp

ompapi.exe: ompapi.F90 testmod.o
	${OMPFC} ${OMPOPT} -o $@ $^

testmod.o: testmod.F90
	${OMPFC} ${OMPOPT} -c -o $@ $<

clean:
	rm -rf *.exe *.o *.s *.mod core *.exe+* *.out
