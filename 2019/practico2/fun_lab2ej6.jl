include("ripf.jl")

function fun_lab2ej6(x)  # log es el logaritmo natural
    return log(2*x)/log(2) # otro punto fijo (2**x)/2
end

hx = ripf(fun_lab2ej6,1.1,10^-7,100)
println(hx)

