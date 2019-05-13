using DelimitedFiles
import Pkg; Pkg.add("Polynomials")
using Polynomials
function eje1()
	xs = LinRange(0,pi*4,50)
	# dispercion normal de cuanto?
	ys = map(x -> cos(x) , xs)# ys = [f(xs[i])] con i = 1,....,length(xs)
	plot(xs,ys)
   
	#preguntar
    puntos = 0:0.01:1

    # ajuste  polinomial.
    for i in 1:5
        coeficientes = polyfit(xs,ys,i)
        funcion = polyval(coeficientes, puntos)
        plot!(puntos,funcion)
    end
	
	return 0

end