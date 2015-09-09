%TESTBENCH Summary of this function goes here
%   Detailed explanation goes here
function testbench()
	fase = 0;
	offset = 0;
	fs = 200;

	freq = 10; amp = 1;

	tests = 3;
	N = logspace(1, tests);
	M = length(N);
	timeFFT = zeros(M, 1);
	timeDFT = zeros(M, 1);
	for i = 1:M
		[y, t] = fsenoidal(amp, freq, fase, offset, N(i), fs);
% 		plot(y);
% 		hold on;
		tic;
		Y = fft(y);
		timeFFT(i) = toc;
		tic;
		[Y, F] = myDFT(y, 1);
		timeDFT(i) = toc;
% 		stem(F, abs(Y));
	end
	plot(N, timeFFT, N, timeDFT); title('Comparacion de tiempos'); xlabel('Cantidad de muestras'); ylabel('Tiempo [s]'); legend('FFT', 'myDFT');
end
