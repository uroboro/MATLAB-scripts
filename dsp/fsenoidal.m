function [ y, t ] = fsenoidal( f0, A, F, offset, N, fs )
%fsenoidal Funcion senoidal
%   Detailed explanation goes here
    t = 0:1/fs:(N-1)/fs;
    t = t.';
    y = offset + A * sin(2 * pi * f0 * t + F);
end
