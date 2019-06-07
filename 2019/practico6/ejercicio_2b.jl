include("ejercicio_2a.jl")
function soleg(A,b)
    U,y = egauss(A,b);
    x = soltrsup(U,y);
end
