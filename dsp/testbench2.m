%TESTBENCH Twiddle factors tests
%   Detailed explanation goes here

function testbench2
	N = 16;
	fs = 2*pi;
	n=pi/4;
	figure(2);
	x = Signal_GenerateSine(N, fs, 1, n, pi/2);
	subplot(1, 2, 1); plot(x);
	X = myDFT(x);
	subplot(1, 2, 2); stem(abs(X));
end
