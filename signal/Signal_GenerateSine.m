% Generate sine wave
% Usage:
%       image = Signal_GenerateSine(samples, samplingFrequency, amplitude, frequency);
%       image = Signal_GenerateSine(samples, samplingFrequency, amplitude, frequency, phase);
%       image = Signal_GenerateSine(samples, samplingFrequency, amplitude, frequency, phase, offset);
function [ data, time ] = Signal_GenerateSine( samples, samplingFrequency, amplitude, frequency, varargin )
	defaults = [0, 0];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	phase = defaults(1);
	offset = defaults(2);

% 	if (samplingFrequency/2 <= frequency)
% 		error('Sampling error: (50%) sampling frequency cannot be lower than signal frequency');
% 	end
% 	if (samplingFrequency <= 8000)
% 		warning('Sampling warning: sampling frequency will be upped to telephone sampling frequency (8kHz). Samples will be proportionally be increased.');
% 		samples = samples * 8000 / samplingFrequency;
% 		samplingFrequency = 8000;
% 	end

	time = Base_GenerateSamples(samples, samplingFrequency);
    data = offset + amplitude * sin(2 * pi * frequency * time + phase);
end
