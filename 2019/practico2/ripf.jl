function ripf(fun,x0,err,mit)
    hx = zeros(0)
    append!(hx,x0)
    x_next = x0
    for k in 0:mit
        x_n = x_next
        x_next = fun(x_n);
        if (abs(x_next-x_n) < err)
            println("converge")
            append!(hx,x_next)
            break
        end
        append!(hx,x_next)
    end
    return hx
end


