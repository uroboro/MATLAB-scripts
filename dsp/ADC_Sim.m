%ADC_SIM Simulate ADC sampling error
%   Detailed explanation goes here lol
function [ Sk, noise, nk ] = ADC_Sim( amplitude, samples, samplingFrequency )
    %figure(1);
    [ Sk, ~ ] = Signal_GenerateSine(amplitude, 10, 0, 0, samples, samplingFrequency);
    %subplot(2, 3, 1); plot(Sk); title('Sk');
    
    u = 0;
    sd = 1/10;
    noise = amplitude * (randn(samples, 1) * sd + u);
    %subplot(2, 3, 2); plot(noise); title('Noise');

    sum = Sk + noise;
    %subplot(2, 3, 3); plot(sum); title('Sum');

    rounded = round(sum);
    %subplot(2, 3, 4); plot(rounded); title('rounded');

    int = int8(rounded);
    %subplot(2, 3, 5); plot(int); title('int');

    nk = sum - double(int);
    %subplot(2, 3, 6); plot(nk); title('nk');

end
