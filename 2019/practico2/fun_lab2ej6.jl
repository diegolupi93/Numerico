include("ripf.jl")

function fun_lab2ej6(x)
    return 2^x/2
end

hx = ripf(fun_lab2ej6,1.2,10^-7,100)
println(hx)
