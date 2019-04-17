include("ripf.jl")

function fun_lab2ej6(x)
    return 2^x - 2*x
end

hx = ripf(fun_lab2ej6,1.9999,10^-5,100)

