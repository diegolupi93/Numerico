using LinearAlgebra

function soltrsup(A, b)
    #para matrices triangulares superiores
	
	if det(A) == 0
		error("La matriz es singular")
	end
	
	n = length(b)
	x = zeros(n)
	x[n] = b[n]/A[n,n]
	for k in n-1:-1:1
		suma = 0
	    for j in k+1:n
    		suma += A[k,j]*x[j] 
    	end
    	x[k] = (b[k]-suma)/A[k,k]
	end
	return x
end

function soltrinf(A, b)
    #para matrices triangulares superiores
	
	if det(A) == 0
		error("La matriz es singular")
	end
	
	n = length(b)
	x = zeros(n)
	x[1] = b[1]/A[1,1]
	for k in 2:n
		suma = 0
	    for j in 1:k-1
    		suma += A[k,j]*x[j] 
    	end
    	x[k] = (b[k]-suma)/A[k,k]
	end
	return x
end


x = soltrinf([1, 0, 0; 2, 1, 0; 2, 3, 1], [5;2;4]);

