include("./rnewton.jl")

println("Ingrese valor para calcular su raiz")
global a = parse(Float64, readline())

println("Ingrese el valor inicial para calcular su raiz ")
global x0 = parse(Float64, readline())

println("Ingrese cantidad de iteraciones")
global mit = parse(Int64, readline())

function fun_raiz(x)
    return [x*x-a,2*x]  #donde la primera coordenada es f y la segunda f'
end

r = rnewton(fun_raiz,x0,10^-6,mit)


