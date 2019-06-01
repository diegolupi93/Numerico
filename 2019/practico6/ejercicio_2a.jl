using LinearAlgebra

function egauss(A,b)
	n = length(b)

	if det(A) == 0
		error("La matriz es singular")
	end

	for (k=1:n-1)
		
		j = k+1:n
		v = A(j,k)/A(k,k)
		A(j,k) = 0
		A(j,j) = A(j,j)-v*A(k,j)
		b(j) = b(j) - (v * b(k))
	end
	U = A
	y = b
	return [U,y]
end