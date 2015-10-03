samples = 2e3;
fs = 1e4;
amp = Signal_GenerateSine(samples, fs, 1, 5);
x1 = Signal_GenerateSine(samples, fs, 1, 100);

x = amp .* x1 + x1;

plot(x); hold on;
%plot(amp);
hold off;

figure(1); subplot(2,1,1); plot(abs(hilbert(ecg))); subplot(2,1,2); plot(angle(hilbert(ecg)));
figure(1); subplot(2,1,1); plot(ecg); subplot(2,1,2); plot(conv(ecg, Num));
figure(2); subplot(2,1,1); plot(abs(hilbert(ecg))); subplot(2,1,2); plot(angle(hilbert(ecg)));
figure(3); subplot(2,1,1); plot(ecg_lead); subplot(2,1,2); plot(conv(ecg_lead, Num));