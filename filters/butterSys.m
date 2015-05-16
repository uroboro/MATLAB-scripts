function [ sys ] = butterSys(n, Wn)
	[z, p, k] = butter(n, Wn, 's');
	sys = zpk(z, p, k);
end
