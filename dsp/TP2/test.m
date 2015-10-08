N = 128;
fs = 1e3;
df = fs/N;
R = 200;
Y = zeros(N, R);

for j = 1:R
	fr = 4 * rand - 2;
	f = N/4 * df + fr;
	[X, T] = Signal_GenerateSine(N, fs, 1, f);
	Y(:,j) = fft(X);
end

Y_ = abs(fft(Signal_GenerateSine(N, fs, 1, N/4 * df)));

P = 1:N;
y_abs = abs(Y);
% P = 1:N/2;
% y_abs = y_abs(P,:);

subplot(1, 1, 1);
plot(P-1, y_abs(:,1));
hold on;
for j = 2:R
	plot(P-1, y_abs(:,j));
end
hold off;
title('Espectro señal bitonal');
xlabel('Frecuencia [bins]'); xlim([1 N/2-1]);
ylabel('Magnitud [veces]');

err = zeros(R, 1);
for j = 1:R
	err(j) = y_abs(N/4, j)^2 - Y_(N/4)^2;
end
err = sqrt(mean(err));
% plot(0:R-1, err);
