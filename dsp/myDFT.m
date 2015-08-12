function [ X ] = myDFT( x )
%MYDFT Summary of this function goes here
%   Detailed explanation goes here
    N = length(x);
    n = 0:N-1;
    X_ = zeros(1,N);
    for ii = 0:N-1
        X_(ii+1) = x.' * exp(1i * 2 * pi * n.' / N * ii);
    end
    X = X_.';
end
