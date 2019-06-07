using LinearAlgebra

function egauss(A,b)
	n = length(b)

	if det(A) == 0
		error("La matriz es singular")
	end

	for k in 1:n-1
        for i in k+1:n
            z = A[i,k]/A[k,k]
            for j in k+1:n
                A[i,j] = A[i, j] - z*A[k,j]
            end
            b[i] = b[i] - z*b[k]
        end 
	end
	U = A
	y = b
	return U, y
end
