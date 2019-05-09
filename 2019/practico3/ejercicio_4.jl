
function fun(x)
    return 1/(1+25*x^2)
end

function eje_3(fun)
	z = LinRange(-1,1,200)
	funa = []
	for i in 1:200
		append!(funa,fun(z[i]))
	end
	for n=1:15
		x = []
		y = []

		for i=1:n
			point = 2*(i-1)/(n - 1)
			append!(x,point)
			append!(y,fun(point))
		end

		
		result = ilagrange(x, y, z);
		using Plots
		plot(z,result,title="f",label=["tan(x)-2x" ""],lw=3)
		plot!(z,funa,title="p",label=["raiz_cuadrada(3)" ""],lw=3)
	end
	return 0
end
