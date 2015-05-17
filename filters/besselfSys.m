function [ sys ] = besselfSys(n, W0)
	[z, p, k] = besself(n, W0);
	sys = zpk(z, p, k);
end
