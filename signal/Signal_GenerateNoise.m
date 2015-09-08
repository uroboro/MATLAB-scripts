% Generate normal noise
% Usage:
%       signal = Signal_GenerateNoise(samples, samplingFrequency, amplitude, mean);
%       signal = Signal_GenerateNoise(samples, samplingFrequency, amplitude, mean, sd);
function [ data, time ] = Signal_GenerateNoise( samples, samplingFrequency, amplitude, varargin )
	defaults = [0, 1];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	u = defaults(1);
	sd = defaults(2);

	time = Base_GenerateSamples(samples, 1);
    data = amplitude * (randn(samples, 1) * sd + u);
end
