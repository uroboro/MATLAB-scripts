%TESTBENCH3 Summary of this function goes here
%   Detailed explanation goes here
function [ output_args ] = testbench3( input_args )
	close all;
	N = 100;
	fs = 100;
	f = round(N/4);
	if 0
		[X, T] = Signal_GenerateSine(N, fs, 1, f);
		[W, F] = myDFT(X, 1);
		stem(abs(W));
		d = [0.01, 0.25, 0.5];
		figure;
		for i = 1:length(d)
			[X, T] = Signal_GenerateSine(N, fs, 1, f+d(i));
			[W, F] = myDFT(X, 1);
			subplot(3, 1, i);
			stem(F, abs(W));
		end
	end
	M = [N/10, N, N*10];
	for i = 1:length(M)
		[X, T] = Signal_GenerateSine(N+M(i), fs, 1, f);
		[W, F] = myDFT(X, 1);
		subplot(3, 1, i);
		stem(F, abs(W));
	end
return	
	N = 100;
	M = 100;
	fs = 100;
	k = 2;
	df = fs/N;
	X1 = Signal_GenerateSine(M*N, fs, 2/N, 2*k*df);
	X2 = Signal_GenerateSine(M*N, fs, 2/N, (0.6+3*k)*df);
	X3 = Signal_GenerateSine(M*N, fs, 2/N, 4*k*df);
	
	X = X1 + X2 + X3;
	Y = zeros(1,M);
	Z = zeros(1,M);
	ventana = hamming(N);
	for t=0:M-1
		
		X_aux = X(t*N+1:(t+1)*N);
		
		[Y_ , F] = myDFT(X_aux);
		aux = abs(Y_);
		Y(t+1)=aux(2*k+1);
		Z(t+1)=aux(4*k+1);
		
	%	subplot(2,1,1); plot(X(3*N+1:4*N));
		X_vent = X_aux .* ventana;
		[Y_ventana, F] = myDFT(X_vent);
% 		subplot(2,1,2); stem(F(1:length(F)/2),abs(Y(1:length(Y)/2)));
		aux_vent = abs(Y_ventana);
		Y_vent(t+1)=aux_vent(2*k+1);
		Z_vent(t+1)=aux_vent(4*k+1);
	end
	figure;
	subplot(2,1,1);stem(Y);title('Y(n)');xlabel('n');ylabel('');
	subplot(2,1,2);stem(Z);title('Z(n)');xlabel('n');ylabel('');
	figure;
	subplot(2,1,1);stem(Y_vent);title('Y(n) ventaneado');xlabel('n');ylabel('');
	subplot(2,1,2);stem(Z_vent);title('Z(n) ventaneado');xlabel('n');ylabel('');
	
% 	[W, F] = myDFT(X);
% 	figure;
% 	stem(abs(W));
end

