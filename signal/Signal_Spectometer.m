%SIGNAL_SPECTOMETER Show spectrum image of provided data
%   Detailed explanation goes here
function [ ffts ] = Signal_Spectometer( data, frequency )
	dataLength = length(data);
	%fprintf('dataLeft: %d\n', dataLength);

	% Partition data into smaller fragments
	sliceSize = frequency / 100;
	%fprintf('newSize: %d\n', sliceSize);
	slices = floor(dataLength / sliceSize);
	%fprintf('slices: %d\n', slices);
	slicesCount = slices * sliceSize;
	%fprintf('left items: %d\n', dataLength - slicesCount);

	dataStart = data(1 : slicesCount);
	%fprintf('dataStart: %d\n', length(dataStart));
	dataEnd = data(slicesCount + 1 : end);
	%fprintf('dataEnd: %d\n', length(dataEnd));

	dataMatrix = reshape(dataStart, sliceSize, slices);
	%fprintf('size(dataMatrix): %d:%d\n', size(dataMatrix));
	%fprintf('size(dataMatrix(1, :)): %d:%d\n', size(dataMatrix(1, :)));

	% Apply FFT to each fragment
	ffts = fft(dataMatrix);
	%ffts = ffts(1:floor(sliceSize/2), :); % use first half
	%fprintf('size(halfFft): %d:%d\n', size(ffts));
end

