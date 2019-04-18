include("rbisec.jl")


function fun(y, a=x)
    return y - exp(-((1-a*y)^2))
end

function lab2ej7bisec(fun,I,err,iter)
    hx = []
    hf = []
    for i in 0:0.1:1.5 # i itera de 0 a 1.5 en intervalos de 0.1
        global x = i # uso global para fijarle el a en fun(y, a=x)
        result = rbisec(fun,I,10^-5,100)
        last_x = result[1][length(result[1])] #es el ultimo x que obtengo en el metodo de bisección
        eval = fun(last_x)  # evaluo la fun en el ultimo x que obtengo en metodo de bisección, esto quiere decir el mas cercano a la raiz
        if abs(eval) < err # si es menor al error, encontre la y que se aproxima a la raiz
            append!(hx,last_x)
            append!(hf,eval)
        end 
    end
    return [hx,hf] 
end

res = lab2ej7bisec(fun,[0,2],10^-5,100)
using Plots
plot(res[1],res[2],title="lab2ej7bisec",label=["y - exp(-((1-a*y)^2))" ""],lw=3)

