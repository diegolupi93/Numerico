using LinearAlgebra

function jacobi(A,b,e,mit)
	n = length(b)
	x = zeros(n)
	for k in 1:mit
		xa = x[:] #tengo q copiar, ya que en julia es pasaje por referencia, entonces si modifico x, se modificara xa
	    for i in 1:n
	        s=0;
	        for j in 1:n
	            if j!=i
	                s += A[i,j] * x[j] # esa a es la unica diferencia con gauss seidel
	            end
	        end
	        x[i] = (b[i] - s)/A[i,i]
	        if norm((x-xa),Inf) < e
	        	return [x,k]
	        end
	    end
	end
println("supero la cantidad de iteraciones")
return [x,mit]    
end


function gseidel(A,b,e,mit)
	n = length(b)
	x = zeros(n)
	for k in 1:mit
		xa = x[:] #tengo q copiar, ya que en julia es pasaje por referencia, entonces si modifico x, se modificara xa
	    for i in 1:n
	        s=0;
	        for j in 1:n
	            if j!=i
	                s += A[i,j] * xa[j] # esa a es la unica diferencia con jacobi 
	            end
	        end
	        x[i] = (b[i] - s)/A[i,i]
	        if norm((x-xa),Inf) < e
	        	return [x,k]
	        end
	    end
	end
println("supero la cantidad de iteraciones")
return [x,mit]    
end

