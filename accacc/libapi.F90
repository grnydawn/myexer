MODULE OmpApiMod
USE, INTRINSIC :: ISO_C_BINDING

INTEGER :: val = 1

public dataenter, dataexit, val

CONTAINS

SUBROUTINE dataenter(L1, L2, X, Y, Z) BIND(C, name="dataenter")
    USE, INTRINSIC :: ISO_C_BINDING

    INTEGER, INTENT(IN):: L1, L2
    REAL(8), DIMENSION(L1, L2), INTENT(IN) :: X, Y, Z

    !$acc enter data copyin(X, Y) create(Z)

END SUBROUTINE

SUBROUTINE dataexit(L1, L2, Z) BIND(C, name="dataexit")
    USE, INTRINSIC :: ISO_C_BINDING

    INTEGER, INTENT(IN):: L1, L2
    REAL(8), DIMENSION(L1, L2), INTENT(OUT) :: Z

    !$acc exit data copyout(Z)

END SUBROUTINE

END MODULE
