include("ejercicio_1.jl")
function fun(x)
	return exp(-x)
end

function ejer2()
    error_abs = 0
    integral_numerica = 0
    integral_funcion = 1 - 1/exp(1)
    puntos = [4,10,20]
    for i in 1:3
    	
        integral_numerica = intenumcomp(fun,0,1,puntos[i],"trapecio")
        error_abs = abs(integral_numerica - integral_funcion)
        println("El error con ", puntos[i], " subintervalos en trapecio es: ", error_abs)

        integral_numerica = intenumcomp(fun,0,1,puntos[i],"pm")
        error_abs = abs(integral_numerica - integral_funcion)
        println("El error con ", puntos[i], " subintervalos en Punto medio es: ", error_abs)

        integral_numerica = intenumcomp(fun,0,1,puntos[i],"simpson")
        error_abs = abs(integral_numerica - integral_funcion)
        println("El error con ", puntos[i], " subintervalos en SIMPSON es: ", error_abs)
        println()
    end
end

ejer2()