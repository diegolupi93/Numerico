using DelimitedFiles
using Plots

function ejer3a()
    xs = []
    ys = []

    # load datos
    x = readdlm("datos3a.dat", '\t', Float64, '\n')
    n = Int(length(x)/2)
    for i in 1:n
        append!(xs, x[i])
        append!(ys, x[n+i])
    end
    # Graficar los datos y el ajuste obtenido.
    plot(xs,ys)

    ln_x = map(x -> exp(x), xs)
    ln_y = map(x -> exp(x), ys)
    # ya que y =C*x^A  <==> ln(y) = ln(C*x^A)  <==> ln(C) + A*ln(x)
    # ajuste lineal.
    coeficientes = polyfit(ln_x, ln_y, 1)

    puntos = 1:0.01:5
    funcion = map(x -> exp(x) , polyval(coeficientes, puntos))#exp(ln(y))= y

    plot!(puntos,funcion)
    return 0
end
