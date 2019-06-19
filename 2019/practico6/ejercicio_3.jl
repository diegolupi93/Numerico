using LinearAlgebra
include("ejercicio_1.jl")

function sollu(A,b)

    F = lu(A)
    y = soltrinf(F.L,b)
    x = soltrsup(F.U,y)

    return x
end


