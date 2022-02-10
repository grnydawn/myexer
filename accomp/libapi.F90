MODULE OmpApiMod
USE, INTRINSIC :: ISO_C_BINDING

INTEGER :: val = 1

public dataenter, dataexit, getval, val

CONTAINS

INTEGER (C_INT64_T) FUNCTION getval() BIND(C, name="getval")
    USE, INTRINSIC :: ISO_C_BINDING
    INTEGER(C_INT64_T) :: res

    getval = LOC(val)
    !getval = 1

END FUNCTION

SUBROUTINE dataenter(L1, L2, X, Y, Z) BIND(C, name="dataenter")
    USE, INTRINSIC :: ISO_C_BINDING

    INTEGER, INTENT(IN):: L1, L2
    REAL(8), DIMENSION(L1, L2), INTENT(IN) :: X, Y, Z

    !$omp target enter data map(to: X, Y) map(alloc: Z)

END SUBROUTINE

SUBROUTINE dataexit(L1, L2, Z) BIND(C, name="dataexit")
    USE, INTRINSIC :: ISO_C_BINDING

    INTEGER, INTENT(IN):: L1, L2
    REAL(8), DIMENSION(L1, L2), INTENT(OUT) :: Z

    !$omp target exit data map(from: Z)

END SUBROUTINE

END MODULE
