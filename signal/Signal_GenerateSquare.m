% Generate sine wave
function [ out, time ] = Signal_GenerateSquare( samples, samplingFrequency, amplitude, frequency, phase, offset, percentageOn )
    time = 0:1/samplingFrequency:(samples - 1) / samplingFrequency;
%    time = linspace(0, (samples - 1) / samplingFrequency, samplingFrequency);
    time = time.';
%     cycle = length(time)/frequency
    out = offset + amplitude * sin(2 * pi * frequency * time + phase);
end
