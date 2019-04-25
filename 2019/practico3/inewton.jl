function prod_diff(x,list_x,i)
    prod = 1
    for j in 1:i-1
        prod *= (x-list_x[j])
    end
    return prod
end

function diferencias_divididas(x,y)
	n = length(x)
	coef = zeros(n,n)
	for i in 1:n
		coef[1,i] = y[i]  
	end
	for j in 2:n
		for i in 1:(n-j+1)
			coef[j,i] = (coef[j-1,i+1]-coef[j-1,i])/(x[i+j-1]-x[i])
		end
	end
	return coef
end


function inewton(x,y,z)
    m = length(z)
    n = length(x)
    if n != length(y)
        println("arreglos de diferente longitud")
        return
    end 
    a = diferencias_divididas(x,y)#devuelve una matriz, y nosotros usamos el primer elemento de cada fila como nuestros coeficientes
    sum = 0
    W = zeros(0)
    for j in 1:m
        sum = 0
        for i in 1:n
            # z[j] es el punto a valuar
            # x es la lista de las entradas
            # y es la lista de los f(x)
            sum += a[i,1]*prod_diff(z[j],x,i)
        end
        append!(W,sum)
    end
    return W
end 
