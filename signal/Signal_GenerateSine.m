% Generate sine wave
function [ out, time ] = Signal_GenerateSine( amplitude, frequency, phase, offset, samples, samplingFrequency )
    time = 0:1/samplingFrequency:(samples - 1) / samplingFrequency;
%    time = linspace(0, (samples - 1) / samplingFrequency, samplingFrequency);
    time = time.';
    out = offset + amplitude * sin(2 * pi * frequency * time + phase);
end
