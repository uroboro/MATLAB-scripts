% Generate sine wave
% Usage:
%       image = Signal_GenerateSine(samples, samplingFrequency, amplitude, frequency);
%       image = Signal_GenerateSine(samples, samplingFrequency, amplitude, frequency, phase);
function [ data, time ] = Signal_GenerateSine( samples, samplingFrequency, amplitude, frequency, varargin )
	defaults = [0, 0];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	phase = defaults(1);

	time = Base_GenerateSamples(samples, samplingFrequency);
    data = amplitude * sin(2 * pi * frequency * time + phase);
end
