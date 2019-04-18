function rnewton(fun,x0,err,mit)
    hx = zeros(0)
    hf = zeros(0)
    x_ant = 0
    x_n = x0
    for i in 1:mit
        x_ant = x_n
        fun_value = fun(x_ant)
        f = fun_value[1]
        fp = fun_value[2]
        x_n = x_ant - f/fp
        append!(hx,x_ant)
        append!(hf,f)
        if f == 0
            return [hx,hf]
        end
        if (abs(x_n-x_ant)/x_n < err) || abs(f) < err
            break 
        end
    end
    # agrego el xn
    append!(hx,x_n)
    append!(hf,fun(x_n)[1])
    return [hx,hf]
end


