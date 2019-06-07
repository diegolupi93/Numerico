using DelimitedFiles
using Plots
using Polynomials

function ejer3a()
    xs = []
    ys = []

    # load datos
    x = readdlm("datos3a.dat", '\t', Float64, '\n')
    xs = x[:,1]
    ys = x[:,2]
    # Graficar los datos y el ajuste obtenido.
    plot(xs,ys, seriestype=:scatter, label= "funcion")

    ln_x = log.(xs)
    ln_y = log.(ys)
    # ya que y =C*x^A  <==> ln(y) = ln(C*x^A)  <==> ln(C) + A*ln(x) = ln(y)
    # ajuste lineal.
    coeficientes = polyfit(ln_x, ln_y, 1)

    puntos = LinRange(1,5,1000)
    b = coeficientes.a[1]
    a = coeficientes.a[2]
    b = exp(b)
    f(x) = b*x^a
    plot!(puntos, f.(puntos), label="Ajuste obtenido")

end
