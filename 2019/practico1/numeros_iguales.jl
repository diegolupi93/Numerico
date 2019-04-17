function iguales()
    println("ingresa el primer numero")
    n = parse(UInt8, readline())
    println("ingresa el segudo numero")
    m = parse(UInt8, readline())
    println("El mas grande es:")
    if n < m
        println(m)
    elseif n > m
        println(n)
    else
        println("Ninguno, son iguales")
    end
    return
end
iguales()

