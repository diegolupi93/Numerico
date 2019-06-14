include("ejercicio_1.jl")
function a(x)
	return x*exp(-x)  # retorna la funcion de la integral
end

function b(x)
	return (1+x^2)^(3/2)  # retorna la funcion de la integral
end

function c(x)
	return x*sin(x)  # retorna la funcion de la integral
end

#falta el d


function ejer4(funciones, valor_integrales, err, I)
	a = I[1]
	b = I[2]
	for i in 1:length(funciones)
		m = Inf
		N = 1
		while m > err 
			simpson = intenumcomp(funciones[i],a,b,N,"simpson")
			m = abs(simpson - valor_integrales[i])  
			N += 1  
		end
		println("El numero de intervalos que debe tener simpson para la ", i, "-ésima funcion es: ", N-1)
		m = Inf
		N = 1
		while m > err
			trapecio = intenumcomp(funciones[i],a,b,N,"trapecio")
			m = abs(trapecio- valor_integrales[i])
			N += 1
		end
		println("El numero de intervalos que debe tener Trapecio para la ", i, "-ésima funcion es: ", N-1)
	end

end

ejer4([a,b,c], [1-2*exp(-1), 1.567951962208787, sin(1)-cos(1)], 10^-5, [0,1])


