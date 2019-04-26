function horn(coefs,x)
    n = length(coefs)
    b = coefs[1]

    for i = 2:n
        b = coefs[i] + b*x
    end
    return b 
end


#a = horn([ 1 -5 6 2 2],2)
#println(a)
