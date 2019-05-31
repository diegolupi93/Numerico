using DelimitedFiles
using Plots
using Polynomials
function eje()
	xs = LinRange(0,1,50)
    result = []
	# dispercion normal de cuanto?
	ys = map(x -> asin(x) , xs)# ys = [f(xs[i])] con i = 1,....,length(xs)
	#plot(xs,ys)
    append!(result,[xs,ys])
	#preguntar
    puntos = 0:0.01:1

    # ajuste  polinomial.
    for i in 1:5
        coeficientes = polyfit(xs,ys,i)
        funcion = polyval(coeficientes, puntos)
        #plot!(puntos,funcion)#preguntar porq no grafica los plots
        append!(result,[puntos,funcion])
    end
	
	return result

end

result = eje()
plot(result[1],result[2], label="Recta")
global i = 3
while (i < length(result))#preguntar porq no plotea
    plot!(result[i], result[i+1], label="Ajuste")
    global i = i + 2
end



