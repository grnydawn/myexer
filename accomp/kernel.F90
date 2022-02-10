MODULE OmpApiKnl

public runkernel, putval

CONTAINS

SUBROUTINE putval(val) BIND(C, name="putval")
    USE, INTRINSIC :: ISO_C_BINDING
    INTEGER, INTENT(IN) :: val

    print *, "VAL = ", val
END SUBROUTINE
    
SUBROUTINE runkernel(L1, L2, X, Y, Z) BIND(C, name="runkernel")
    USE, INTRINSIC :: ISO_C_BINDING
    USE OmpApiMod, ONLY : val

    INTEGER, INTENT(IN):: L1, L2
    REAL(8), DIMENSION(L1, L2), INTENT(IN) :: X, Y
    REAL(8), DIMENSION(L1, L2), INTENT(OUT) :: Z

    INTEGER i, j

    !$omp target teams num_teams(L1)
    !$omp distribute
    DO i=1, L1
        !$omp parallel do
        DO j=1, L2
            Z(i, j) = X(i, j) + Y(i, j) + val
        END DO
        !$omp end parallel do
    END DO
    !$omp end target teams

END SUBROUTINE

END MODULE
