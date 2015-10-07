% Welch's periodogram
function [ output_args ] = my_welch(x, L, over, win)
	if ((over >= 1) || (over < 0))
		error('condition (0 <= over < 1) not met');
	end
	n0 = (1 - over) * L;
	nsect = 1 + floor((length(x) - L) / n0);
	for i = 0:nsect-1
		output_args = output_args + my_moddedPeriodogram(x, win,(i*n0),(i+1)*n0-1) / nsect;
	end
end
