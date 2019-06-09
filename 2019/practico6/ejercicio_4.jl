include("ejercicio_3.jl")

A = [4 -1 0 -1 0 0 ; -1 4 -1 0 -1 0; 0 -1 4 0 0 -1; -1 0 0 4 -1 0; 0 -1 0 -1 4 -1; 0 0 -1 0 -1 4]
b1 = [1, 1, 1, 0, 0, 0]
b2 = [1, 1, 1, 1, 1, 1]

println(sollu(A,b1))
println(sollu(A,b2))
