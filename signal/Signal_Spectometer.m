%SIGNAL_SPECTOMETER Show spectrum image of provided data
%   Detailed explanation goes here
function [ output_args ] = Signal_Spectometer( data, frequency )
	dataLength = length(data);
	%fprintf('dataLeft: %d\n', dataLength);
	% Partition data into smaller fragments
	sliceSize = frequency/100;
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
	fprintf('size(dataMatrix): %d:%d\n', size(dataMatrix));
	%fprintf('size(dataMatrix(1, :)): %d:%d\n', size(dataMatrix(1, :)));

	% Apply FFT to each fragment
	ffts = fft(dataMatrix);
	halfFft = ffts(1:floor(sliceSize/2), :);
	fprintf('size(halfFft): %d:%d\n', size(halfFft));

	% Display as graph
	subplot(2, 1, 2);
	plot(1:length(halfFft(:, 1)), abs(halfFft(:, 1)));
	title('Spectrum');
	xlabel('Frequency (Hz)');
	ylabel('|Y(f)|');

	figure(2)
	imagesc(flipud(abs(halfFft)));
	% title('Amplitude Spectrum of y(t)');
	xlabel('Frequency (Hz)');
	% ylabel('|Y(f)|');
end

