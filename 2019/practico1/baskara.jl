function mala(a::Int, b::Int, c::Int)
    p_raiz = (-b + sqrt(b*b-4*c*a))/(2*a)
    s_raiz = (-b - sqrt(b*b-4*c*a))/(2*a)
    return [p_raiz,s_raiz]
    
end

function buena(a::Int, b::Int, c::Int)
    p_raiz = ((4*a*c)/(-b))/((1-sqrt(1-(4*a*c)/(b^2)))*2*a)
    s_raiz = ((4*a*c)/(-b))/((1+sqrt(1-(4*a*c)/(b^2)))*2*a)
    return [p_raiz,s_raiz]
end
println("mala")
println(mala(2,-4,1))
println("buena")
println(buena(2,-4,1))
