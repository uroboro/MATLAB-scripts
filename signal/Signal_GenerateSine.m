% Generar tono puro a partir de la frecuencia especificada
%	f: frecuencia del audio a generar
%	A: maximo del audio a generar
%	t: vector temporal
function [ out ] = Signal_GenerateSine(f, A, t)
	out = A * sin(2 * pi / f * t);
end