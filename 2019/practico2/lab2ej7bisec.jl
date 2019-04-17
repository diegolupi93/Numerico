include("rbisec.jl")


function fun(y, a=x)
    return y - exp(-((1-a*y)^2))
end
 
for i in 0.5:0.1:2
    global x = i
    global hx = zeros(0)
    append!(hx,rbisec(fun,[0,1.5],10^-5,100))
end

println(hx)
