using DelimitedFiles
#import Pkg; Pkg.add("Polynomials")
using Polynomials
using Plots
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
	#plot(xs,ys)
    #plot!(puntos,funcion)
	return [xs,ys],[puntos,funcion]

end

list_a, list_b = eje1()
plot(list_a[1],list_a[2],seriestype=:scatter, label="Recta") 
plot!(list_b[1],list_b[2],label="Ajuste obtenido")
