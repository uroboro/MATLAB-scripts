% Generate triangular wave
% Usage:
%       signal = Signal_GenerateTriangle(samples, samplingFrequency, amplitude, frequency);
%       signal = Signal_GenerateTriangle(samples, samplingFrequency, amplitude, frequency, percentageOn);
%       signal = Signal_GenerateTriangle(samples, samplingFrequency, amplitude, frequency, percentageOn, phase);
function [ out, time ] = Signal_GenerateTriangle( samples, samplingFrequency, amplitude, frequency, varargin )
	defaults = [0.5, 0, 0];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	percentage = defaults(1);
	phase = defaults(2);

	time = Base_GenerateSamples(samples, samplingFrequency);
    cycle = 1/frequency;
	p = percentage;
	q = 1 - p;
	tmp = mod(time + phase, cycle);
	for i = 1:length(time);
		a = tmp(i);
		if (a < p * cycle / 2)
			tmp(i) = 2 * frequency / p * a;
		elseif (p * cycle / 2 <= a && a < p * cycle)
			tmp(i) = 2 - 2 * frequency / p * a;
		elseif (p * cycle <= a && a < (1 + p) * cycle / 2)
			tmp(i) = 2 * p / q - 2 * frequency / q * a;
		else
			tmp(i) = - 2 / q + 2 * frequency / q * a;
		end
	end
    out = amplitude * tmp;
end