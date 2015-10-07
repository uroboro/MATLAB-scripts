%tp3: comprobar sesgo y varianza
% periodograma
% bartlet
% welch

varianza = 9;
tic;

R = 300; % Realizaciones
N = [2^9, 2^10, 2^11, 2^12, 2^13, 2^14]; % Muestras

rows = 3; cols = 1;
Z = [];
for i = 1:length(N)
	x = sqrt(varianza) * randn(N(i), R);

	X = periodogram(x);
	clear x;

	X_ = mean(X, 2);
	Y_ = var(X, 0, 2);

	P = transpose(1:length(X_)) / length(X_);

	figure(i);
	subplot(rows, cols, 1); plot(P, 20*log(X(:,1))); title('Periodogramas'); ylabel('Magnitud [dB]'); xlabel('Frecuencia [pi]');
	hold on;
	for j = 2:R; plot(P, 20*log(X(:,j))); end
	hold off;
	subplot(rows, cols, 2); plot(P, 20*log(X_)); title('Promedio periodogramas'); ylabel('Magnitud [dB]'); xlabel('Frecuencia [pi]');
	subplot(rows, cols, 3); plot(P, Y_); title('Varianza periodogramas'); ylabel('Magnitud [veces]'); xlabel('Frecuencia [pi]');

	clear X X_ Y_ P i j;
end

toc
