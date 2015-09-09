% ADC_SIM Simulate ADC sampling error
% Usage:
%	[ Sk, noise, nk ] = ADC_Sim(samples, samplingFrequency, amplitude)
function [ Sk, noise, nk ] = ADC_Sim(samples, samplingFrequency, amplitude)
    %figure(1);
    [ Sk, ~ ] = Signal_GenerateSine(samples, samplingFrequency, amplitude, 10);
    %subplot(2, 3, 1); plot(Sk); title('Sk');
    
    u = 0;
    sd = 1/10;
    noise = amplitude * (randn(samples, 1) * sd + u);
    %subplot(2, 3, 2); plot(noise); title('Noise');

    sum = Sk + noise;
    %subplot(2, 3, 3); plot(sum); title('Sum');

    nk = sum - double(int8(round(sum)));
    %subplot(2, 3, 6); plot(nk); title('nk');

end
