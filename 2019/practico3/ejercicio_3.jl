using Plots
include("inewton.jl")

function fun(x)
    return 1/x
end

function eje_3(fun)
    x = []
    y = []
    z = LinRange(1,5,101)
    for i in 1:5
        append!(x,i)
        append!(y,fun(i))
    end
    return inewton(x,y,z),x, y, z
end

pol, x, f, z = eje_3(fun)
plot(x, f, seriestype=:scatter, label= "funcion")
plot!(z, pol,  label= "Polinomio")

