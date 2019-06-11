using Plots
using Polynomials


global x = LinRange(0,4*pi,50)
global y = cos.(x)

function ajuste(x, grado)

    ymap = zeros(0)

    poly = polyfit(x, y, grado)
    append!(ymap,polyval(poly, x))

    return ymap

end

for j = 1:5
    sumres = sum(y-(ajuste(x, j)))
    println("Suma residuo grado ", j,": ", sumres)
end
