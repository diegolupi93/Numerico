function a(x)
	return x*exp(-x), exp(-x)*(x-2), exp(-x)*(x-4) # retorna la funcion, derivada segunda y derivada cuarta
end

#agregar las otras funciones

function ejer4(funciones, err, I)
	a = I[1]
	b = I[2]
	for i in 1:length(funciones)
		e = Inf
		N = 1
		while e > err 
			h = (b-a)/N
			e = max(abs(((b-a)/180*h^4*funciones[i](a)[3])), abs(((b-a)/180*h^4*funciones[i](b)[3]))) # supongo el maximo en los extremos
			N += 1
		end
		println("El numero de intervalos que debe tener simpson para la", i, "-ésima funcion es: ", N)
		e = Inf
		N = 1
		while e > err
			h = (b-a)/N
			e = max(abs(-((b-a)/12*h^2*funciones[i](a)[2])), abs(-((b-a)/12*h^2*funciones[i](b)[2]))) # supongo el maximo en los extremos
			N += 1
		end
		println("El numero de intervalos que debe tener Trapecio para la", i, "-ésima funcion es: ", N)
	end

end

ejer4([a], 10^-5, [0,1])