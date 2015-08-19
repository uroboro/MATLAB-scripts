%http://hyperphysics.phy-astr.gsu.edu/hbase/Music/vowel.html#c3
%function [Y T] = voice()
function voice()
	sampleSize = 1;
	samples = 4000;

	T = 0 : sampleSize : samples;
	Y = zeros(1, length(T));
	%Y = Y + 1. * Math_GaussianBell(T, 230, 100);
	Y = Y + 1. * Math_GaussianSlope(T, 0, 0.003).^3;
	Y = Y + .3 * Math_GaussianBell(T, 2250, 180);
	Y = Y + .3 * Math_GaussianBell(T, 3200, 250);
	
%	fprintf('T: %d; H: %d\n', length(T), length(T));
%	figure('Name', 'Frequencies', 'NumberTitle', 'off', 'Position', [50 50 1000 600]);
%	plot(T, Y), grid;

	WAV_Fs = 8400;
	T0 = 1 / WAV_Fs;
	t = 0 : T0 : T0 * (samples - 1);
	WAV_Synth = zeros(1, length(t));
	for j = 1:length(T)
		WAV_Synth = WAV_Synth + Signal_PureTone(j, 10*Y(j), t);
	end
	%plot(t, WAV_Synth), grid;

	wavplay(WAV_Synth, WAV_Fs);
%return;

	% Ajuste del espectro (la fft lo provee entre 0 y Fs en vez de -Fs/2 a Fs/2)
	WAV_Esp_FFT_Synth = fftshift(fft(WAV_Synth));
	
	% Vector de frecuencia discreta
	f = -WAV_Fs / 2 : WAV_Fs / samples : (WAV_Fs / 2) * (1 - 1 / samples);

	% Visualizacion del espectro (MODULO)
	UFS_VisWav2(WAV_Fs, t, WAV_Synth, WAV_Esp_FFT_Synth, f);

return;

%		     [offset s amplitude; ... ];
	values = [650 150 9; 1200 100 2; 2600 160 2; 1000 500 4];
	Offset = [0 0];
	for j = 1:length(values)
		Offset = [min(Offset(1), values(j,1)) max(Offset(2), values(j,1))];
	end
	Y = zeros(1, length(T));
	for j = 1:length(values)
		Y = Y + values(j,3) * Math_GaussianBell(T, values(j,1), values(j,2));
	end

	plot(T, Y), grid;

end

% Visualizacion de archivos WAV
% Visualizacion de espectros WAV
%	WAV_Fs: frecuencia del audio
%	t: vector temporal
%	WAV_Synth: muestras del audio syntetizado
%	WAV_Esp_FFT_Synth: FFT del audio syntetizado
%	f: vector de frecuencia discreta
function UFS_VisWav2(WAV_Fs, t, WAV_Synth, WAV_Esp_FFT_Synth, f)
	F = figure('Name', 'Signal and FFT', 'NumberTitle', 'off', 'Position', [50 50 1000 600]);

	%Tono generado
	h = subplot(2,1,1);
	plot(h, t, WAV_Synth, 'r.-'), grid(h);
	title(h, 'Signal');
	axis(h, [t(1) t(round(0.01 * WAV_Fs)) min(WAV_Synth) max(WAV_Synth)]);
	xlabel(h, 't [seg]'), ylabel(h, 'f(t)');
	legend(h, ['Fs=' num2str(WAV_Fs) ' Hz']);

	% Tono generado
	h = subplot(2,1,2);
	plot(h, f, abs(WAV_Esp_FFT_Synth), 'r.-'), grid(h);
	title(h, 'Espectro tono generado');
	axis(h, tight);
	xlabel(h, 'f [Hz]'), ylabel(h, '|F(f)|');

end