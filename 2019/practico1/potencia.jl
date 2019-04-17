function fact(n::Int, m::Int)
    x = 1
    for i = 2:n
       x *= i 
    end
    return x
end

fact(6,3)
