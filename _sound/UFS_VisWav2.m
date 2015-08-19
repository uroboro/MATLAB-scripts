% Visualizaci?n archivos WAV
function UFS_VisWav2(filename, WAV_Fs, t, WAV_Sen, WAV_Sen1, T, Tt)
	fig = figure('name', T);

	%Se?al adquirida
	subplot(2, 1, 1), plot(t, WAV_Sen), grid;
	axis([t(1) t(round(0.5 * WAV_Fs)) min(WAV_Sen) max(WAV_Sen)]); 
	title(['Archivo: ' filename], 'Fontsize', 14);
	xlabel('t [seg]'), ylabel('f(t)');
	legend(['Fs=' num2str(WAV_Fs) ' Hz']);

	%Tono puro generado
	subplot(2, 1, 2), plot(t, WAV_Sen1, 'r.-'), grid;
	axis ([t(1) t(round(0.01 * WAV_Fs)) min(WAV_Sen1) max(WAV_Sen1)]); 
	title(Tt);
	xlabel('t [seg]'), ylabel('ftp(t)');
end