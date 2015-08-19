x1 = 'Lorem ipsum dolor sit amet';

x2 = double(x1);
t = 0:length(x2) - 1; % Time vector

subplot(3, 1, 1);
plot(t, x2);
title('Original Signal');
xlabel('Character index');
ylabel('ASCII value');


%bode(Y);
x3 = fft(x2);
f = 1:length(x3);
% Plot single-sided amplitude spectrum.
subplot(3, 1, 2);
plot(f, abs(x3));
title('Single-Sided Amplitude Spectrum of y(t)');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');

x4 = ifft(x3);
t_ = 0:length(x4) - 1;
subplot(3, 1, 3);
plot(t_, x4);
title('Reconstructed Signal');
xlabel('Character index');
ylabel('ASCII value');

x5 = char(x4);
