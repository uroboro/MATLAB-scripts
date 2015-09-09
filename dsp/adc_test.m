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

% Simule el efecto de cuantizar una se�al continua en el tiempo mediante un
% conversor anal�gico digital. Para ello analice se�ales determin�sticas como
% las generadas en 1, y otras que var�en de forma m�s aleatoria, por ejemplo
% a�adiendo ruido mediante random. Muestre un ejemplo representativo de
% cada uno de estos casos.

% Puede simular una se�al continua mediante una se�al muestreada a una fs
% muy alta en comparaci�n con las fs que quiere estudiar, y un tipo de dato
% double. Pruebe de cuantizarlo a muestras de 4, 8 y 16 bits. Describa el ruido
% de cuantizaci�n para cada tama�o de muestra mediante:
% a. La propia se�al temporal y su espectro.
% b. Una descripci�n de la se�al, por medio de su energ�a, valor medio, RMS.
% c. Un histograma de los valores que toma la se�al.
% d. Una descripci�n del histograma, por medio de estad�sticos como la media, desv�o est�ndar y varianza.
