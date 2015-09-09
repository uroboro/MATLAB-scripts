%TESTBENCH3 Summary of this function goes here
%   Detailed explanation goes here
function [ output_args ] = testbench4( input_args )
% 	close all;
	tic;
	tests = 1000;

	N = 100;
	M = 1000;
	fs = 1000;

	df = fs/N;
	fstart = 4*df;
	separacion = 4*df;

	% generacion de señales
	X1 = Signal_GenerateSine(M*N, fs, 2/N, fstart);
	X3 = Signal_GenerateSine(M*N, fs, 2/N, fstart+separacion);
	frand = rand(tests,1) - 0.5;
	
	X = zeros(M*N,tests);
	for i = 1:tests
		X(:,i) = X1 + X3 + Signal_GenerateSine(M*N, fs, 2/N, fstart+separacion/2 + frand(i)*df);
	end

	% dispersiones en frecuencias adyacentes de la desplazada
	Y = zeros(M,tests);
	Z = zeros(M,tests);

	for i = 1:tests
		for t = 0:M-1
			X_aux = X(t * N + 1:(t + 1) * N, i);

			Y_ = fft(X_aux);
			aux = abs(Y_);
			Y(t + 1, i) = aux(4 + 1);
			Z(t + 1, i) = aux(8 + 1);
		end
	end
	clear X_aux;
	clear aux;
	clear Y_;

	% concatenacion de espectros
	Y_sum = [];
	Z_sum = [];
	for i = 1:tests
		Y_sum = [Y_sum; mean(Y(:,i))];
		Z_sum = [Z_sum; mean(Z(:,i))];
	end

	% histogramas
	figure;
	subplot(2,1,1);
	hist(Y_sum,200);title('Y(n)');xlabel('n');ylabel('');
	subplot(2,1,2);
	hist(Z_sum,200);;title('Z(n)');xlabel('n');ylabel('');
	
%	[Y_count, Y_hist] = hist(Y);
%	[Z_count, Z_hist] = hist(Z);
%	subplot(2,1,1);stem(Y_count, Y_hist);title('Y(n)');xlabel('n');ylabel('');
%	subplot(2,1,2);stem(Z_count, Z_hist);title('Z(n)');xlabel('n');ylabel('');

% 	[W, F] = myDFT(X);
% 	figure;
% 	stem(abs(W));
	output_args = toc;
end
