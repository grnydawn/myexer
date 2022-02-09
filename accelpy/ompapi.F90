
PROGRAM OmpApiTest

    use test, only : L1, L2, X, Y, Z
    INTEGER a

    X = 1
    Y = 2
    Z = 0

    !call dataenter

    !print *, "TT", omp_get_default_device()
    !a = omp_get_num_procs()
    a = 1
    !print *, "TT", omp_get_num_procs()
    !print *, "TT",  a

    !$omp target teams num_teams(L1)
    !$omp distribute
    DO i=1, L1
        !$omp parallel do num_threads(L2)
        DO j=1, L2
            Z(i, j) = X(i, j) + Y(i, j)
        END DO
        !$omp end parallel do
    END DO
    !$omp end target teams

    !call dataexit

    PRINT *, "Z = ", Z

CONTAINS

SUBROUTINE dataenter()
    use test, only : X, Y, Z

    !$omp target enter data map(to: X, Y) map(alloc: Z)

END SUBROUTINE

SUBROUTINE dataexit()
    use test, only : Z

    !$omp target exit data map(from: Z)

END SUBROUTINE

END PROGRAM
