include("ejercicio_5.jl")


A = [3 1 1; 2 6 1; 1 1 4]
b = [5;9;6]
println("A = ",A)
println("b = ", b)
x = jacobi(A,b,10^-11,1000)
println("Solucion jacobi: ", x[1], " cantidad de iteraciones ", x[2])
x = gseidel(A,b,10^-11,1000)
println("Solucion gseidel: ", x[1], " cantidad de iteraciones ", x[2])
println()

A = [5 7 6 5; 7 10 8 7; 6 8 10 9; 5 7 9 10]
b = [23;32;33;31]
println("A = ",A)
println("b = ", b)
x = jacobi(A,b,10^-4,10000)
println("Solucion jacobi: ", x[1], " cantidad de iteraciones ", x[2])
x = gseidel(A,b,10^-4,10000)
println("Solucion gseidel: ", x[1], " cantidad de iteraciones ", x[2])