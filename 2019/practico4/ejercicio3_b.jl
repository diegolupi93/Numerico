using DelimitedFiles
using Plots
using Polynomials

function ejer3a()
    xs = []
    ys = []

    # load datos
    x = readdlm("datos3b.dat", '\t', Float64, '\n')
    xs = x[:,1]
    ys = x[:,2]
    # Graficar los datos y el ajuste obtenido.
    plot(xs, ys, seriestype=:scatter, label= "funcion")
    f(x) = 1/x
    # ajuste lineal.
    coeficientes = polyfit(xs, xs./ys, 1)
    b = coeficientes.a[1]
    a = coeficientes.a[2]
    q(x) = x/(a*x + b)
    puntos = LinRange(0,20,1000) 

    plot!(puntos, q.(puntos), label="Ajuste obtenido")
end


