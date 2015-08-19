% Get data
read = 0;
if (read == 1)
	[file, data, freq] = Audio_Load('imaginary_mp3cut.wav');
	Audio_Play(file, data, freq);
	dataLeft = data(:, 1);
else
    freq = 44100;
	T = 441;
	dataLeft = [];
    T_ = 0:1/freq:((T-1)/freq);
    dataLeft = [dataLeft (0.6*sin(2*pi* 100 * T_) + 0.3*sin(2*pi* 500 * T_))];
    dataLeft = [dataLeft (0.6*sin(2*pi* 200 * T_) + 0.3*sin(2*pi* 600 * T_))];
    dataLeft = [dataLeft (0.6*sin(2*pi* 300 * T_) + 0.3*sin(2*pi* 700 * T_))];
    dataLeft = [dataLeft (0.6*sin(2*pi* 400 * T_) + 0.3*sin(2*pi* 800 * T_))];

%     [s1, ~] = Signal_GenerateSine(0.6, 200, 0, 0, T, freq);
%     [s2, ~] = Signal_GenerateSine(0.3, 500, 0, 0, T, freq);
%  	dataLeft = [dataLeft s1+s2];
%     [s1, ~] = Signal_GenerateSine(0.6, 300, 0, 0, T, freq);
%     [s2, ~] = Signal_GenerateSine(0.3, 450, 0, 0, T, freq);
%  	dataLeft = [dataLeft s1+s2];
%     [s1, ~] = Signal_GenerateSine(0.6, 150, 0, 0, T, freq);
%     [s2, ~] = Signal_GenerateSine(0.3, 400, 0, 0, T, freq);
%  	dataLeft = [dataLeft s1+s2];
%     [s1, ~] = Signal_GenerateSine(0.6, 250, 0, 0, T, freq);
%     [s2, ~] = Signal_GenerateSine(0.3, 850, 0, 0, T, freq);
%  	dataLeft = [dataLeft s1+s2];
	%sound(dataLeft, freq);
end
figure(1)
subplot(2, 1, 1);
plot(1:length(dataLeft), dataLeft);
title('Signal');
xlabel('Time (s)');
ylabel('x(t)');

Signal_Spectometer(dataLeft, freq)