MODULE OmpApiKnl

public runkernel

CONTAINS
    
SUBROUTINE runkernel(L1, L2, X, Y, Z) BIND(C, name="runkernel")
    USE, INTRINSIC :: ISO_C_BINDING
    USE OmpApiMod, ONLY : val

    INTEGER, INTENT(IN):: L1, L2
    REAL(8), DIMENSION(L1, L2), INTENT(IN) :: X, Y
    REAL(8), DIMENSION(L1, L2), INTENT(OUT) :: Z

    INTEGER i, j

    !$acc parallel num_gangs(L1) num_workers(L2)
    !$acc loop gang
    DO i=1, L1
        !$acc loop worker
        DO j=1, L2
            Z(i, j) = X(i, j) + Y(i, j) + val
        END DO
    END DO
    !$acc end parallel

END SUBROUTINE

END MODULE
