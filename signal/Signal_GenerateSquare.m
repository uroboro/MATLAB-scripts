% Generate square wave
%       image = Signal_GenerateSquare(samples, samplingFrequency, amplitude, frequency);
%       image = Signal_GenerateSquare(samples, samplingFrequency, amplitude, frequency, percentageOn);
%       image = Signal_GenerateSquare(samples, samplingFrequency, amplitude, frequency, percentageOn, phase);
%       image = Signal_GenerateSquare(samples, samplingFrequency, amplitude, frequency, percentageOn, phase, offset);
function [ out, time ] = Signal_GenerateSquare( samples, samplingFrequency, amplitude, frequency, varargin )
	defaults = [0.5, 0, 0];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	percentageOn = defaults(1);
	phase = defaults(2);
	offset = defaults(3);

	time = Base_GenerateSamples(samples, samplingFrequency);
%     cycle = length(time)/frequency
    out = offset + amplitude * sin(2 * pi * frequency * time + phase);
end
