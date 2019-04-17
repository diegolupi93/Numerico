include("./rnewton.jl")

function fun_raiz(x,a=3)
    return [x*x-a,2*x]  #donde la primera coordenada es f y la segunda f'
end

r = rnewton(fun_raiz,2,10^-6,100)



