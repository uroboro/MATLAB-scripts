% Generate square wave
% Usage:
%       signal = Signal_GenerateSquare(samples, samplingFrequency, amplitude, frequency);
%       signal = Signal_GenerateSquare(samples, samplingFrequency, amplitude, frequency, percentageOn);
%       signal = Signal_GenerateSquare(samples, samplingFrequency, amplitude, frequency, percentageOn, phase);
function [ out, time ] = Signal_GenerateSquare( samples, samplingFrequency, amplitude, frequency, varargin )
	defaults = [0.5, 0, 0];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	percentage = defaults(1);
	phase = defaults(2);

	time = Base_GenerateSamples(samples, samplingFrequency);
    cycle = 1/frequency;
	tmp = mod(time + phase, cycle);
	for i = 1:length(time);
		tmp(i) = (tmp(i) < percentage * cycle);
	end
    out = amplitude * tmp;
end
