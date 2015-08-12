function testbench()
%TESTBENCH Summary of this function goes here
%   Detailed explanation goes here
    samples = 100;
    fase = 0;
    offset = 0;
    fs = 100;

    freq = 10; amp = 1;
    [y, t] = fsenoidal(freq, amp, fase, offset, samples, fs);
    plot(t, y);
    hold on;

    Y = myDFT(y);
    stem(1:length(Y), abs(Y));

end
