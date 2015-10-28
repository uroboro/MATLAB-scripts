%LOCATE Summary of this function goes here
%   Detailed explanation goes here
function [ output_args ] = locate( x, t )
	L = length(x);
	data = zeros(L,1);
	m = 1;
	min_ = min(x);
	max_ = max(x);
	
	for n = 1:L
	switch (t)
	case 0 % minimos locales
		if (n == 1 || n == L)
			continue
		end
		X = x(n-1:n+1);
		if (x(n) == min(X))
			data(m) = n;
			m = m + 1;
		end

	case 1 % minimo abs
		if (x(n) == min_)
			data(m) = n;
			m = m + 1;
		end

	case 2 % maximos locales
		if (n == 1 || n == L)
			continue
		end
		X = x(n-1:n+1);
		if (x(n) == max(X))
			data(m) = n;
			m = m + 1;
		end

	case 3 % maximo abs
		if (x(n) == max_)
			data(m) = n;
			m = m + 1;
		end

	end
	end
	
	output_args = data(1:m-1);
end

