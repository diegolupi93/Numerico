include("ejercicio_1.jl")

function senint(x)
    y = []

    for i=1:length(x)
        cant_puntos = x(i)/0.1
        append!(y, intenumcomp(@fun3, 0, x(i), cant_puntos,"trapecio"))
    for

    puntos = 0:0.05:2*pi
    seno = map(x -> sin(x) ,puntos)

    plot(puntos, seno, label="Seno")
    

    plot!(x,y,label="Ajuste")
    
end


senint(0:0.5:2*pi)