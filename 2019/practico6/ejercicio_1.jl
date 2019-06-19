using LinearAlgebra

function soltrsup(A, b)
    #para matrices triangulares superiores
	
	if det(A) == 0
		error("La matriz es singular")
	end
	
	n = length(b)
	x = b
	x[n] = b[n]/A[n,n]
	for k in n-1:-1:1
	    for j in 1:k-1
    		x[j] = x[j] - A[j,n]*x[n]
    	end
    	x[k] = (x[k]-A[k,n]*x[n])/A[k,k]
    	n = n -1
	end
	return x
end


function soltrinf(A, b)
    #para matrices triangulares superiores
	
	if det(A) == 0
		error("La matriz es singular")
	end
	
	n = length(b)
	x = b
	x[1] = b[1]/A[1,1]
	for k in 2:n
	    for j in k+1:n
    		x[j] = x[j] - A[j,k-1]*x[k-1]
    	end
    	x[k] = (x[k]-A[k,k-1]*x[k-1])/A[k,k]
	end
	return x
end
