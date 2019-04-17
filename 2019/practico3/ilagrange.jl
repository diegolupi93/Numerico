# x,y son las coordenadas de los pares a interpolar (o sea p(xi) = yi)
# z son los valores para evaluar p
# la salida debe ser w tal que w[j] = p(z[j])


function sumatoria(x, y, z_i, n)
    # z_i es el valor para evaluar el polinomio
    suma = zeros(0)
    sum = 0
    for i in 1:n
        x_i = x[i]
        prod = 1
        for j in 1:n
            x_j = x[j]
            if i != j
                prod *= (z_i - x_j)/(x_i - x_j)  
            end
        end
        sum += prod*y[i]
        append!(suma,sum)  
    end
    return suma
end

function ilagrange(x,y,z)
    m = length(z)
    n = length(x)
    W = zeros(0)
    if n != length(y)
        println("Los pares x,y no son de la misma longitud")
        return
    end
    for i in 1:m
        append!(W, sumatoria(x, y, z[i], n))
    end
    return W
end
