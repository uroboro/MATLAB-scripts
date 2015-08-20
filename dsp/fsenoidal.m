%fsenoidal Funcion senoidal
%   Detailed explanation goes here
function [ y, t ] = fsenoidal( A, f0, F, offset, N, fs )
    t = transpose(linspace(0, (N - 1) / fs, N));
    y = offset + A * sin(2 * pi * f0 * t + F);
end
