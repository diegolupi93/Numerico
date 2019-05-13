using DelimitedFiles
import Pkg; Pkg.add("Polynomials")
using Polynomials
function eje1()
	xs = LinRange(0,10,20)
	# dispercion normal de cuanto?
	ys = map(x -> 3/4*x - 1/2 , xs)# ys = [f(xs[i])] con i = 1,....,length(xs)
	ys = ys + reshape(rand(1,length(xs)),length(xs))#rand retorna una matriz 1x20, y ys es una lista
	coeficientes = polyfit(xs, ys, 1)
	#a = coeficientes[1]; b = coeficientes[0], donde f(x) = ax +b
	#preguntar si esta bien la cantidad de puntos
	puntos = 0:0.1:10
    funcion = polyval(coeficientes, puntos)
	# falta graficar los [xs,ys] y la [puntos,function]
	plot(xs,ys)
	#secundario
    puntos = 0:0.1:5
    funcion = polyval(coeficientes, puntos)
    plot!(puntos,funcion)
	return 0

end