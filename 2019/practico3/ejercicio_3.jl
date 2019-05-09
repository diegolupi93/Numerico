include("inewton.jl")

function fun(x)
    return 1/x
end

function eje_3(fun)
    z = []
    x = []
    y = []
    C = 24/25 #LinRange(1,5,101)
    for i in 1:101
        append!(z, C+i/25)
    end
    for i in 1:5
        append!(x,i)
        append!(y,fun(i))
    end
    return inewton(x,y,z), y, z
end

pol, f, z = eje_3(fun)

