import os, sys
import numpy as np
from numpy.ctypeslib import ndpointer
from ctypes import c_int, POINTER, CDLL, RTLD_GLOBAL

N1 = 2
N2 = 3

def slibcall(func, *data):

    func.restype = None

    dargs = [ndpointer(d.dtype) for d in data]
    func.argtypes = [POINTER(c_int), POINTER(c_int)] + dargs

    return func(c_int(N1), c_int(N2), *data)

def main():

    here = sys.argv[1]

    X = np.ones(N1*N2, order="F").reshape((N1, N2))
    Y = np.ones(N1*N2, order="F").reshape((N1, N2)) * 2
    Z = np.zeros(N1*N2, order="F").reshape((N1, N2))

    apilib = CDLL(os.path.join(here, "libapi.so"), mode=RTLD_GLOBAL)
    knllib = CDLL(os.path.join(here, "kernel.so"), mode=RTLD_GLOBAL)

    dataenter = getattr(apilib, "dataenter")
    slibcall(dataenter, X, Y, Z)

    kernel = getattr(knllib, "runkernel")
    slibcall(kernel, X, Y, Z)

    dataexit = getattr(apilib, "dataexit")
    slibcall(dataexit, Z)

    #Z = X + Y

    print(Z)


if __name__ == "__main__":
    main()
