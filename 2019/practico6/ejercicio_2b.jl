include("ejercicio_2a.jl")
include("ejercicio_1.jl")
function soleg(A,b)
    U,y = egauss(A,b)
    x = soltrsup(U,y)
    return x
end


