% Cargar archivo wav a partir de una ruta especificada o interactivamente.
%	fileName: nombre del archivo
%	data: muestras del audio
%	frequency: frecuencia del audio
function [fileName, data, frequency] = Audio_Load(varargin)
	if (~isempty(varargin)) % acepta argumentos opcionales
		filePath = varargin{1}; % siendo el primero la ruta de un archivo
		[~, name, ext] = fileparts(filePath);
		fileName = [name ext]; % formar nombre de archivo
		if (~exist(filePath, 'file')) % si no existe
			uiwait(msgbox(['File not found: ' fileName], 'File error', 'modal'));
		end
	else
		% obtener un archivo interactivamente
		[fileName, pathName] = uigetfile('*.*', 'Enter data file');
		filePath = [pathName fileName];
	end
	
%	[data, frequency, WAV_nbits] = wavread([pname filename]);
	[data, frequency] = audioread(filePath);
end
