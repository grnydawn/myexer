
PROGRAM OmpApiTest

    USE OmpApiMod, only : dataenter, dataexit
    USE OmpApiKnl, only : runkernel

    INTEGER, PARAMETER :: L1 = 2, L2 = 3
    REAL(8), DIMENSION(L1, L2) :: X, Y, Z

    X = 1
    Y = 2
    Z = 0

    call dataenter(L1, L2, X, Y, Z)

    call runkernel(L1, L2, X, Y, Z)

    call dataexit(L1, L2, Z)

    PRINT *, "Z = ", Z

END PROGRAM
