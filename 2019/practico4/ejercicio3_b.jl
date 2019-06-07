function ejer3a()
    xs = []
    ys = []

    # load datos
    x = readdlm("datos3b.dat", '\t', Float64, '\n')
    n = Int(length(x)/2)
    for i in 1:n
        append!(xs, x[i])
        append!(ys, x[n+i])
    end
    # Graficar los datos y el ajuste obtenido.
    plot(xs,ys)

    xs_tilde = map(x -> 1/x, xs)
    ys_tilde = map(x -> 1/x, ys)#devo dividir por x?

    # ajuste lineal.
    coeficientes = polyfit(xs_tilde, ys_tilde, 1)

    puntos = 0.1:0.1:20
    funcion = map(x -> x*x , polyval(coeficientes, puntos))#devo multiplicar por x?

    plot!(puntos,funcion)
    return 0
end
