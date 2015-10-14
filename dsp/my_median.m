% Calculate median of signal
function [ output_args ] = my_median( x, L )
	N = length(x);
	X = x;
	for n = 1:N
		x_ = zeros(L,1);
		for i = -floor(L/2) : floor(L/2)
			n_ = n + i;
			if (n_ < 1)
				n_ = N + n_;
			elseif (n_ > N)
				n_ = n_ - N;
			end
			x_(i + floor(L/2) + 1) = x(n_);
		end
		X(n) = median(x_);
	end
	output_args = X;
end
