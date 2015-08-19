% Reproducir señal wav
%	fileName: nombre del archivo
%	data: muestras del audio
%	frequency: frecuencia del audio
function [ p ] = Audio_Play(fileName, data, frequency)
	msgbox(['Reproduciendo: ' fileName], 'Reproduccion Sonido', 'replace');
	p = audioplayer(data, frequency);
	playblocking(p);
end