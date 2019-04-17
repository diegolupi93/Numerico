function horn(coefs,x)
    n = length(coefs)
    b = coefs[n]

    for i = n-1:-1:1
        b = coefs[i] + b*x
    end
    return b
end


horn([ 2 6 -5 1],2)
