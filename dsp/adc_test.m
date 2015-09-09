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
	figure(1);
	subplot(3, 2, 1); plot(Sk); title('Sk'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');
%	subplot(3, 2, 2); plot(noise); title('noise'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');
%	subplot(3, 2, 3); plot(T, nk4, T, nk8, T, nk16); title('nk'); xlabel('Muestra [N]'); ylabel('Amplitud [veces]');
	legend('4 bits', '8 bits', '16 bits', 'Location', 'eastoutside');
end

% figure(2);
% histogram(nk);

x = Sk;
Energy = (x.' * x);
ValMedio = ones(1, length(x)) * x / length(x);
RMS = sqrt((x.' * x) / length(x));

% Simule el efecto de cuantizar una señal continua en el tiempo mediante un
% conversor analógico digital. Para ello analice señales determinísticas como
% las generadas en 1, y otras que varíen de forma más aleatoria, por ejemplo
% añadiendo ruido mediante random. Muestre un ejemplo representativo de
% cada uno de estos casos.

% Puede simular una señal continua mediante una señal muestreada a una fs
% muy alta en comparación con las fs que quiere estudiar, y un tipo de dato
% double. Pruebe de cuantizarlo a muestras de 4, 8 y 16 bits. Describa el ruido
% de cuantización para cada tamaño de muestra mediante:
% a. La propia señal temporal y su espectro.
% b. Una descripción de la señal, por medio de su energía, valor medio, RMS.
% c. Un histograma de los valores que toma la señal.
% d. Una descripción del histograma, por medio de estadísticos como la media, desvío estándar y varianza.
