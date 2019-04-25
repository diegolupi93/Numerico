function horn(coefs,x)
    n = length(coefs)
    b = coefs[n]

    for i = n-1:-1:1
        b = coefs[i] + b*x
    end
    return b 
end


a = horn([1 -5 6 2],2)
println(a)
