%TESTBENCH5 Periodogram basico
function [ output_args ] = testbench5( varargin )
	defaults = [9];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	varianza = defaults(1);
	tic;

	R = 1e3; % Realizaciones
	N = [2^10, 2^11, 2^12, 2^13]; % Muestras

	output_args = [];
	
	rows = 4;
	for i = 1:length(N)
		x = sqrt(varianza) * randn(N(i), R);

		figure(i);
		X_p = periodogram(x);
		subplot(rows,1,1);
		plot(X_p); title('Periodogram');
		
		for ii=1:R
			ffft = fft(x(:,ii));
			ffft2 = ffft(1:length(ffft)/2+1);
			clear ffft;
			X(:,ii) = 1 / N(i) * (abs(ffft2)).^2;
			clear ffft2;
		end
		
		subplot(rows,1,2);
 		plot(X); title('Periodograma');

		X_ = mean(X, 2);
		subplot(rows,1,3);
		plot(X_); title('mean Periodogram');
		
		Y_ = var(X, 0, 2);
		subplot(rows,1,4);
		plot(Y_); title('var Periodogram');

		output_args = [ output_args; X_(1), Y_(1)];
	end

	toc
end
