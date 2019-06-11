using Plots
include("ejercicio_1.jl")

function senint(x)
    y = []
    for i in 1:length(x)
        cant_puntos = x[i]/0.1
        aux = intenumcomp(cos, 0, x[i], trunc(Int,cant_puntos),"trapecio")
        append!(y, aux)
    end
    
    seno = sin.(x)

    plot(x, seno, seriestype=:scatter,  label="Seno")
    

    plot!(x,y,label="Ajuste")
    
end


senint(0:0.5:2*pi)
