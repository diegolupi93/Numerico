using DelimitedFiles
import Pkg; Pkg.add("Polynomials")
using Polynomials
function eje1()
	xs = []
	ys = []
	x = readdlm("datos1a.dat", '\t', Float64, '\n')
	n = Int(length(x)/2)
	for i in 1:n
		append!(xs, x[i])
		append!(ys, x[n+i])
	end
	coeficientes = polyfit(xs, ys, 1)
	#a = coeficientes[1]; b = coeficientes[0], donde f(x) = ax +b
	
	#principal
	plot(xs,ys)
	#secundario
    puntos = 0:0.1:10
    funcion = polyval(coeficientes, puntos)
    plot!(puntos,funcion)
    
	return 0

end

eje1()