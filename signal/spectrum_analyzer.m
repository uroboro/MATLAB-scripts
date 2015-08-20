% Get data
switch (1)
case 0
	[file, data, freq] = Audio_Load('imaginary_mp3cut.wav');
	Audio_Play(file, data, freq);
	data_ = data(:, 1);
case 1
	freq = 44100;
	T = 441*50;
	data_ = [];
	data_ = [data_; Telephony_PhoneTone(T, freq, '1')];
	data_ = [data_; Telephony_PhoneTone(T, freq, '5')];
	data_ = [data_; Telephony_PhoneTone(T, freq, '9')];
	data_ = [data_; Telephony_PhoneTone(T, freq, '2')];
	data_ = [data_; Telephony_PhoneTone(T, freq, '4')];
	data_ = [data_; Telephony_PhoneTone(T, freq, '6')];
	data_ = [data_; Telephony_PhoneTone(T, freq, '8')];
	data_ = [data_; Telephony_PhoneTone(T, freq, '0')];
	sound(data_, freq);
case 2
	freq = 44100;
	T = 441*50;
	m = 10;
	data_ = [];
	[s1, ~] = Signal_GenerateSine(T, freq, 0.6, 10*m);
	[s2, ~] = Signal_GenerateSine(T, freq, 0.3, 50*m);
 	data_ = [data_; s1+s2];
	[s1, ~] = Signal_GenerateSine(T, freq, 0.6, 20*m);
	[s2, ~] = Signal_GenerateSine(T, freq, 0.3, 60*m);
 	data_ = [data_; s1+s2];
	[s1, ~] = Signal_GenerateSine(T, freq, 0.6, 30*m);
	[s2, ~] = Signal_GenerateSine(T, freq, 0.3, 70*m);
 	data_ = [data_; s1+s2];
	[s1, ~] = Signal_GenerateSine(T, freq, 0.6, 40*m);
	[s2, ~] = Signal_GenerateSine(T, freq, 0.3, 50*m);
 	data_ = [data_; s1+s2];
	sound(data_, freq);
end

% Show signal
figure(1);
plot(data_); title('Signal'); xlabel('Time (s)'); ylabel('Amplitude');

% Present on image
figure(2);
ffts = Signal_Spectometer(data_, freq);
imagesc(abs(ffts));
title('Amplitude Spectrum of signal over time');
xlabel('Time (s)'); ylabel('Frequency (Hz)');
