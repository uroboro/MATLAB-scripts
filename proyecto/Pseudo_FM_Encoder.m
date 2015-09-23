%PSEUDO_FM_ENCODER Summary of this function goes here
%   Detailed explanation goes here
function [ output_args ] = Pseudo_FM_Encoder( varargin )
	output_args = varargin;
	fs = 4410 * 2; % frecuencia de sampling
	sf = 1e3; % muestras por

	data1 = [ 85, 1, 1, 1, 1 ];
 	data2 = [ 85, 2, 2, 2, 2 ];
	data3 = [ 85, 4, 4, 4, 4 ];
	data4 = [ 85, 8, 8, 8, 8 ];

	freq = [200; 400; 800; 1600];
	data = [data1; data2; data3; data4];
	clear data1 data2 data3 data4;
	[channels, lengths] = size(data);

	outputdata = zeros(8 * lengths * sf, 1);
	for channel = 1:channels
		data_ = data(channel,:);
		freq_ = freq(channel);

		bindata = [];
		for i = 1:length(data_)
			bindata = [bindata; transpose(bitget(data_(i), 1:8))];
		end; clear i;

		sinedata = [];
		for i = 1:length(bindata)
			time = transpose(0 : 1/fs : (sf - 1)/fs) + i * (sf - 1)/fs;
			timeLength = length(time);
			sinedata = [sinedata; sin(2 * pi * freq_ * (0.9 + 0.2 * bindata(i)) * time(1:timeLength/2))];
			sinedata = [sinedata; sin(2 * pi * freq_ * (0.9 + 0.2 * not(bindata(i))) * time(timeLength/2+1:end))];
		end; clear i;
		outputdata = outputdata + sinedata;
	end; clear channel;
	clear data_ freq_;
	clear bindata;
	clear time sinedata;
	clear channels lengths;

	imagesc(flipud(abs(Pseudo_Spectometer(outputdata, 44100))));
	sound(outputdata);
	output_args = 1;
end

function [ ffts ] = Pseudo_Spectometer( data, frequency )
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
	ffts = ffts(1:floor(sliceSize/2), :); % use first half
	clear sliceSize dataMatrix;
end
