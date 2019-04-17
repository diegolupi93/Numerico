function rbisec(fun,I,err,mit)
    hx = zeros(0)
    hf = zeros(0)
    b = I[2]
    a = I[1]
    c = (a+b)/2     
    append!(hx,c)
    append!(hf,fun(c))
    if fun(c) == 0
        return [hx,hf]
    end
    error = (b-a)/2
    for i in 2:mit
        if abs(error) < err
            break
        end 
        if fun(c)*fun(a) > 0
            a = c
        else
            b = c
        end
        c = (a+b)/2
        append!(hx,c)
        append!(hf,fun(c))
        if fun(c) == 0
            break
        end
        error = error/2
    end
    return [hx,hf]
end


