include("./fun_lab2ej2a.jl")
include("./fun_lab2ej2b.jl")
include("./rbisec.jl")

x = rbisec(fun_lab2ej2a,[0.8,1.4],10^-5,100)
y = rbisec(fun_lab2ej2b,[1.5,2],10^-5,100)
println(x[1])
println(x[2])
using Plots
plot(x[1],x[2],title="ejercicio2_c",label=["tan(x)-2x" ""],lw=3)
plot!(y[1],y[2],title="fun_lab2ej2b",label=["raiz_cuadrada(3)" ""],lw=3)

