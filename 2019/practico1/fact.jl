function fact(n::Int)
    x = 1
    for i = 2:n
       x *= i 
    end
    return x
end

fact(6)
