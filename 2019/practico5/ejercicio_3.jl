include("ejercicio_1.jl")

function senint(x)
    y = []
    f(x) = cos(x)
    for i=1:length(x)
        cant_puntos = x(i)/0.1
        append!(y, intenumcomp(f, 0, x(i), cant_puntos,"trapecio"))
    for

    
    seno = sin.(x)

    plot(x, seno, label="Seno")
    

    plot!(x,y,label="Ajuste")
    
end


senint(0:0.5:2*pi)