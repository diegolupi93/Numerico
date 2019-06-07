using LinearAlgebra
include("ejercicio_1.jl")

function sollu(A,b)

    F = lu(A)
    y = soltrinf(F.L,F.P*b)
    x = soltrsup(F.U,y)

    return x
end

A = [4 -1 0 -1 0 0 ; -1 4 -1 0 -1 0; 0 -1 4 0 0 -1; -1 0 0 4 -1 0; 0 -1 0 -1 4 -1; 0 0 -1 0 -1 4]
b1 = [1, 1, 1, 0, 0, 0]
b2 = [1, 1, 1, 1, 1, 1]

println(sollu(A,b1))
