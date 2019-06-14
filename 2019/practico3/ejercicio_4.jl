using Plots
include("ilagrange.jl")

function fun(x)
    return 1/(1+25*x^2)
end

function eje_3(fun)
	z = LinRange(-1,1,200)
	funa = fun.(z)
    plot(z,funa, seriestype=:scatter,label="raiz_cuadrada(3)")
	for n=1:15
		x = []
		y = []
		for i=1:n+1 
			point = 2*(i-1)/(n - 1)
			append!(x,point)
			append!(y,fun(point))
		end
		result = ilagrange(x, y, z)
        Plots.display(plot!(z,result))    
    end 
end
        
eje_3(fun)
