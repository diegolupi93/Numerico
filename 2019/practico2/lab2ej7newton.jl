include("./rnewton.jl")


function fun(y, a=x)
    f = y - exp(-((1-a*y)^2)) # f es la funcion valua en y
    fp = 1 - exp(-((1-a*y)^2))*(-2*(1-a*y)*-a) # es la derivada de la funcion en y
    return [f,fp] 
end

function lab2ej7newton(fun,x0,err,iter)
    hx = []
    hf = []
    for i in 0.0:0.1:1.5 # i itera de 0 a 1.5 en intervalos de 0.1
        global x = i # uso global para fijarle el x en fun(y, a=x)
        result = rnewton(fun,x0,10^-5,100)
        last_x = result[1][length(result[1])] #es el ultimo x que obtengo en el metodo de newton
        eval = fun(last_x)[1]  # evaluo la fun en el ultimo x que obtengo en metodo de newton, esto quiere decir el mas cercano a la raiz
        if abs(eval) < err # si es menor al error, encontre la y que se aproxima a la raiz
            append!(hx,last_x)
            append!(hf,eval)
        end 
    end
    return [hx,hf] 
end

res = lab2ej7newton(fun,0.7,10^-5,100)
using Plots
plot(res[1],res[2],title="lab2ej7bisec",label=["y - exp(-((1-a*y)^2))" ""],lw=3)