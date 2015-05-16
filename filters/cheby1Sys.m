function [ sys ] = cheby1Sys(n, Wn, Rp)
	[z, p, k] = cheby1(n, Rp, Wn, 's');
	sys = zpk(z, p, k);
end
