A = 100;
samples = 1000;
fs = 100;

for ii=1:3
    [Sk, noise, nk] = ADC_Sim(A, samples, fs);
    figure;
    subplot(3, 1, 1); plot(Sk); title('Sk');
    subplot(3, 1, 2); plot(noise); title('noise');
    subplot(3, 1, 3); plot(nk); title('nk');
end

% figure(2);
% histogram(nk);
