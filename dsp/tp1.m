%% Trabajo Práctico 1
% Muestreo de señales

%% Ejercicio 1
% Realizar funciones para generar las señales dadas.

%%
% * Senoidal
signal = Signal_GenerateSine(200, 1000, 1, 100, pi/2);
plot(signal); title('Señal senoidal'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 0.4 fs
signal = Signal_GenerateSine(200, 1000, 0.8, 400);
plot(signal); title('Señal senoidal (f = 0.4 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 0.5 fs
signal = Signal_GenerateSine(200, 1000, 0.5, 500);
plot(signal); title('Señal senoidal (f = 0.5 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 0.6 fs
signal = Signal_GenerateSine(200, 1000, 0.6, 600, pi / 2);
plot(signal); title('Señal senoidal (f = 0.6 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 1.1 fs
signal = Signal_GenerateSine(200, 1000, 0.2, 1100);
plot(signal); title('Señal senoidal (f = 1.1 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% Se puede ver que al acercar la frecuencia de la señal a la frecuencia de
% sampling se deforma la señal observada. Una vez pasada la frecuencia de
% sampling, la señal observada no coincide con la esperada sino que se
% asemeja a una de mucha menor frecuencia.

%%
% * Cuadrada
signal = Signal_GenerateSquare(200, 1000, 1, 10, 0.3);
plot(signal); title('Señal cuadrada, 30%'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 0.4 fs
signal = Signal_GenerateSquare(200, 1000, 0.8, 100, 0.3);
plot(signal); title('Señal cuadrada, 30% (f = 0.4 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 0.5 fs
signal = Signal_GenerateSquare(200, 1000, 0.5, 500);
plot(signal); title('Señal cuadrada, 50% (f = 0.5 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 0.6 fs
signal = Signal_GenerateSquare(200, 1000, 0.6, 600, 0.5, pi / 2);
plot(signal); title('Señal cuadrada, 50% (f = 0.6 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 1.1 fs
signal = Signal_GenerateSquare(200, 1000, 0.2, 1100);
plot(signal); title('Señal cuadrada, 50% (f = 1.1 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% En esta instancia la señal observada no se nota deformada en las
% frecuencias cercanas a Niquist como en el caso de la senoidal. En esta
% frecuencia vuelve a notarse la incapacidad de medir la señal
% correctamente.

%%
% * Triangular
signal = Signal_GenerateTriangle(200, 1000, 1, 10, 0.3);
plot(signal); title('Señal triangular, 30%'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 0.4 fs
signal = Signal_GenerateTriangle(200, 1000, 0.8, 100, 0.3);
plot(signal); title('Señal triangular, 30% (f = 0.4 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 0.5 fs
signal = Signal_GenerateTriangle(200, 1000, 0.5, 500);
plot(signal); title('Señal triangular, 50% (f = 0.5 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 0.6 fs
signal = Signal_GenerateTriangle(200, 1000, 0.6, 600, 0.5, pi / 2);
plot(signal); title('Señal triangular, 50% (f = 0.6 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% f = 1.1 fs
signal = Signal_GenerateTriangle(200, 1000, 0.2, 1100);
plot(signal); title('Señal triangular, 50% (f = 1.1 fs)'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');

%%
% En esta instancia la señal observada no se nota deformada en las
% frecuencias cercanas a Niquist como en el caso de la senoidal. En esta
% frecuencia vuelve a notarse la incapacidad de medir la señal
% correctamente.

%% Ejercicio 2
% Implemente un algoritmo que calcule la transformada discreta de Fourier

%%
% <include>myDFT.m</include>

%% Ejercicio 3
% La señal senoidal se encuentra acotada en banda dado que es una base de
% la transformada mientras que las otras dos señales no ya que requieren
% una cantidad infinita de coeficientes para representarlas en las mismas
% bases. Se podrían limitar por medio del uso de ventanas o filtros
% pasabajos que reduzcan el espectro de las mismas.

%%
% * a.

signal1 = Signal_GenerateSine(200, 1000, 1, 10);
signal2 = Signal_GenerateSquare(200, 1000, 1, 10);
signal3 = Signal_GenerateTriangle(200, 1000, 1, 10);

%%
% * b.
[Y1,F] = myDFT(signal1, 1);
[Y2,~] = myDFT(signal2, 1);
[Y3,~] = myDFT(signal3, 1);

subplot(1, 3, 1);
stem(F, abs(Y1)); title('Espectro senoidal'); xlabel('Frecuencia [w]'); ylabel('Amplitud [veces]');
subplot(1, 3, 2);
stem(F, abs(Y2)); title('Espectro cuadrada'); xlabel('Frecuencia [w]'); ylabel('Amplitud [veces]');
subplot(1, 3, 3);
stem(F, abs(Y3)); title('Espectro triangular'); xlabel('Frecuencia [w]'); ylabel('Amplitud [veces]');

%% Ejercicio 4
% Prueba de leakage

%%
% * a.

N = 100;
fs = 100;
f = round(N/4);
[X, T] = Signal_GenerateSine(N, fs, 1, f);
[W, F] = myDFT(X, 1);
figure;
stem(F, abs(W)); title('Espectro senoidal (N=100)'); xlabel('Frecuencia [w]'); ylabel('Amplitud [veces]');

%%
d = [0.01, 0.25, 0.5];
for i = 1:length(d)
	[X, T] = Signal_GenerateSine(N, fs, 1, f+d(i));
	[W, F] = myDFT(X, 1);
	subplot(3, 1, i);
	stem(F, abs(W)); title(['Espectro senoidal (f=', num2str(f+d(i)), ')']); xlabel('Frecuencia [w]'); ylabel('Amplitud [veces]');
end

%%
% * b.
M = [N/10, N, N*10];
for i = 1:length(M)
	[X, T] = Signal_GenerateSine(N, fs, 1, f);
	X = [X; zeros(M(i), 1)];
	T = T + M(i);
	[W, F] = myDFT(X, 1);
	subplot(3, 1, i);
	stem(F, abs(W)); title(['Espectro senoidal (N=', num2str(M(i)), ')']); xlabel('Frecuencia [w]'); ylabel('Amplitud [veces]');
end
	
%% Ejercicio 5
% Comparacion de eficiencia de algoritmos de trannsformada de Fourier.
%* FFT, algoritmo optimizado
%* myDFT, algoritmo no optimizado

%%
L = 3;
N = logspace(1, L);
M = length(N);
timeFFT = zeros(M, 1);
timeDFT = zeros(M, 1);
for i = 1:M
	signal = Signal_GenerateSine(N(i), 1000, 1, 10);

	tic;
	fft(signal);
	timeFFT(i) = toc;

	tic;
	myDFT(signal, 1);
	timeDFT(i) = toc;
end
figure;
plot(N, timeFFT, N, timeDFT); title('Comparacion de tiempos'); xlabel('Cantidad de muestras'); ylabel('Tiempo [s]'); legend('FFT', 'myDFT');

%% Ejercicio 6

%% Ejercicio 7
A = 256;
samples = 256;
fs = 1000;

for i = 1:1
	[ Sk, T ] = Signal_GenerateSine(samples, fs, A, 10);
	[ X, F ] = myDFT(Sk);
% 	[ noise, ~ ] = Signal_GenerateNoise(samples, fs, A, 0, 1/10);
% 	sum = Sk + noise;
% 	nk4  = sum - sum * 2^4 / A;
% 	nk8  = sum - double(int8(round(sum)));
% 	nk16 = sum - double(int16(round(sum)));
	T = T * 1000;
	figure;
	subplot(3, 2, 1); plot(Sk); title('Sk'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');
%	subplot(3, 2, 2); plot(noise); title('noise'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');
%	subplot(3, 2, 3); plot(T, nk4, T, nk8, T, nk16); title('nk'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]'); legend('4 bits', '8 bits', '16 bits', 'Location', 'eastoutside');
end

% figure(2);
% histogram(nk);

x = Sk;
Energy = (x.' * x);
ValMedio = ones(1, length(x)) * x / length(x);
RMS = sqrt((x.' * x) / length(x));