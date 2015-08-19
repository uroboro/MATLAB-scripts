%BASE_GENERATESAMPLES Generate samples vector to use as time base
%   Detailed explanation goes here
function [ output_args ] = Base_GenerateSamples( samples, samplingFrequency )
	if (samplingFrequency < 1)
		error('Sampling error: sampling frequency must be greater than 1.');
	end
	samples = floor(samples);
	samplingFrequency = floor(samplingFrequency);

	tmp = 0 : 1 / samplingFrequency : (samples - 1) / samplingFrequency;
	output_args = transpose(tmp);
%   tmp2 = linspace(0, (samples - 1) / samplingFrequency, samples);
%	aa = transpose(tmp2);
end
