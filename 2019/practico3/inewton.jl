function prod_diff(x,list_x,i)
    prod = 1
    for j in 1:i-1
        prod *= (x-list_x[j])
    end
    return prod
end

function coeficientes(x,y)
    n = length(x)
    coef = zeros(0)
    append!(coef,y[1])
    m = 1
    for i in 2:n
        new_coef = y[i] - coef[1]
        for j in 2:i-1
            new_coef -= coef[j]*prod_diff(x[i],x,j)
        end
        new_coef = new_coef / prod_diff(x[m+1],x,m+1)
        append!(coef,new_coef)
        m += 1
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
    a = coeficientes(x,y)
    sum = 0
    W = zeros(0)
    for j in 1:m
        sum = 0
        for i in 1:n
            # z[j] es el punto a valuar
            # x es la lista de las entradas
            # y es la lista de los f(x)
            sum += a[i]*prod(z[j],x,i)
        end
        append!(W,sum)
    end
    return W
end 


