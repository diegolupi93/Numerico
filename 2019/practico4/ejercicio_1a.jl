using DelimitedFiles
using Plots

open("datos1a.dat", "r")    
input = readdlm("datos1a.dat", '\t', '\n')
global x = input[:,1]
global y = input[:,2]

function fun_lab4ej1(a)

    xy = zeros(0)
    x2 = zeros(0)
    n = length(x)
    
    for i = 1:n
        append!(xy, x[i]*y[i])
        append!(x2, x[i]^2)
    end

    xsum = sum(x)
    ysum = sum(y)
    xysum = sum(xy)
    x2sum = sum(x2)

    m = ((n*xysum)-(xsum*ysum))/((n*x2sum)-(abs(xsum))^2)
    b = ((ysum*x2sum)-(xsum*xysum))/((n*x2sum)-(abs(xsum)^2))

    func = m*a+b

    print(func)

    return func
end

#plot(x, y, seriestype=:scatter, label="Datos")
#plot!(fun_lab4ej1, 0, 5, label="Ajuste obtenido") 
