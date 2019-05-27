function intenumcomp(fun,a,b,N,regla)

    # N es la cantidad de subintervalos.
    puntos = LinRange(a,b,N+1)
    result = 0

    for i in 1:N
        b = puntos[i+1]
        a = puntos[i]
        if regla == "trapecio"
            result += 0.5 * (b-a) * (fun(a) + fun(b))
        elseif regla == "pm"
                result += (b-a) * fun((a+b)/2)
        elseif regla == "simpson"
                result += ((b-a)/6) * (fun(a) + 4*fun((a+b)/2) + fun(b))
        else
            println("ERROR. Regla de integración inválida.\n")
            return -1
        end
    end
    return result
end

