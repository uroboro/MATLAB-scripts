%PSEUDO_FM_ENCODER Summary of this function goes here
%   Detailed explanation goes here
function [ output_args outputdata ] = Pseudo_FM_Encoder( varargin )
	output_args = varargin;
	fig = 1;
	t = 1; % 1 segundo
	fs = 44100; % frecuencia de sampling
	sf = fs * t; % muestras

	df = 10;
	d = 2;

	freq = [1e2; 2e2; 4e2; 8e2];
	data = Pseudo_Generate_Data(d);
	bindata = Pseudo_Binary(data);
	manchester = Pseudo_Manchester(bindata);
	[channels, lengths] = size(data);

	outputdata = zeros(8 * lengths * sf, 1);
	for channel = 1:channels
		manchester_ = manchester(channel,:);
		freq_ = freq(channel);

		sinedata = [];
		for n = 1:length(manchester_)
			time = transpose(0 : 1/fs : (sf - 1)/fs) + (n-1) * (sf - 1)/fs;
			timeLength = length(time);
			sinedata = [sinedata; sin(2 * pi * freq_ * (1 + df * 1i^(2*manchester_(n+0))) * time(1:timeLength/2))];
		end; clear n;
		clear bindata_ freq_;
		outputdata = outputdata + sinedata;
	end; clear channel;
	clear time sinedata;
	clear channels lengths;

	figure(fig); fig = fig + 1;
	imagesc(abs(Pseudo_Spectrometer(outputdata, fs)));
	%sound(outputdata);

if 0
	sf = length(outputdata);
	fs = 1000;
	time = transpose(0 : 1/fs : (sf - 1)/fs);
	%sinedata = [sin(2 * pi * fs * time); sin(2 * pi * 2 * fs * (time(end) + time))];
	sinedata = sin(2 * pi * fs * time);
	plot(sinedata);
	imagesc(abs(Pseudo_Spectrometer(outputdata .* sinedata, 44100)));
end

	output_args = 1;
end

%generate data
function [ output ] = Pseudo_Generate_Data(channels)
	data1 = [ 85, 1, 1, 1, 1 ];
 	data2 = [ 85, 2, 2, 2, 2 ];
	data3 = [ 85, 4, 4, 4, 4 ];
	data4 = [ 85, 8, 8, 8, 8 ];

	output = [];
	if (channels >= 1)
		output = [output; data1];
	end;
	if (channels >= 2)
		output = [output; data2];
	end;
	if (channels >= 3)
		output = [output; data3];
	end;
	if (channels >= 4)
		output = [output; data4];
	end
	clear data1 data2 data3 data4;
end

%binary representation
function [ output ] = Pseudo_Binary(x)
	[channels, lengths] = size(x);

	output = zeros(channels, 8 * lengths);
	for channel = 1 : channels
		data = x(channel, :);
		for n = 0:length(data) - 1
			output(channel, (1:8) + n * 8) = transpose(bitget(data(n + 1), 1:8));
		end; clear n;
	end
end

%manchester representation
function [ output ] = Pseudo_Manchester(x)
	[channels, lengths] = size(x);

	output = zeros(channels, 2 * lengths);
	for channel = 1 : channels
		data = x(channel, :);
		for n = 0:length(data) - 1
			output(channel, (1:2) + n * 2) = [data(n + 1) not(data(n + 1))];
		end; clear n;
	end
end

% existe spectrogram pero no da resultados similares
function [ ffts ] = Pseudo_Spectrometer(data, frequency)
	dataLength = length(data);

	% Partition data into smaller fragments
	sliceSize = frequency / 100;
	slices = floor(dataLength / sliceSize);
	clear dataLength;
	slicesCount = slices * sliceSize;

	dataStart = data(1 : slicesCount);
	dataEnd = data(slicesCount + 1 : end);
	clear slicesCount;

	dataMatrix = reshape(dataStart, sliceSize, slices);
	clear dataStart dataEnd slices;

	% Apply FFT to each fragment
 	ffts = fft(dataMatrix);
%	ffts = ffts(1:floor(sliceSize/2), :); % use first half
	clear sliceSize dataMatrix;
end
