% Get data
read = 0;
if (read == 1)
	[file, data, freq] = Audio_Load('imaginary_mp3cut.wav');
	Audio_Play(file, data, freq);
	dataLeft = data(:, 1);
else
	T = 441 * 20;
	dataLeft = [];
	dataLeft = [dataLeft (Signal_GenerateSine(20, 0.6, 1:T) + Signal_GenerateSine(50, 0.3, 1:T))];
	dataLeft = [dataLeft (Signal_GenerateSine(30, 0.6, 1:T) + Signal_GenerateSine(45, 0.3, 1:T))];
	dataLeft = [dataLeft (Signal_GenerateSine(15, 0.6, 1:T) + Signal_GenerateSine(40, 0.3, 1:T))];
	dataLeft = [dataLeft (Signal_GenerateSine(25, 0.6, 1:T) + Signal_GenerateSine(85, 0.3, 1:T))];
	sound(dataLeft, 44100);
end
figure(1)
subplot(2, 1, 1);
plot(1:length(dataLeft), dataLeft);
title('Signal');
xlabel('Time (s)');
ylabel('x(t)');

Signal_Spectometer(dataLeft, freq)