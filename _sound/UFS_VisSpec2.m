% Visualizacion de espectros.
function UFS_VisSpec2(WAV_Esp_FFT, WAV_Esp_1, f, T)
	fig = figure('name', T);

	subplot(2, 1, 1), plot(f,abs(WAV_Esp_FFT), 'b.-'), grid;
	axis tight, xlabel('f [Hz]'), ylabel('|F(f)|');
	title('Espectro señal adquirida');

	subplot(2, 1, 2), plot(f,abs(WAV_Esp_1), 'r.-'), grid;
	axis tight, xlabel('f [Hz]'), ylabel('|F(f)|');
	title('Espectro tono generado');
end