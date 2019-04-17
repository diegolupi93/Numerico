function f(x):
    return 1/x

function ejer3()

	x = zeros(0)
    y = zeros(0) 
	
	

	result = inewton([1,2,3,4,5], [1,1/2,1/3,1/4,1/5], x);
	plot(x,result,'r'); % la dibuja de color rojo
	plot([1,2,3,4,5], [1,1/2,1/3,1/4,1/5],'linewidth',2,'*');
	legend('f(x)', 'forma del Newton del pol. interpolante');
	hold off;
end
