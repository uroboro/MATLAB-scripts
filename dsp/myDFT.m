function [ X, F ] = myDFT( x )
%MYDFT Summary of this function goes here
%   Detailed explanation goes here
    N = length(x);
    n = 0:N-1;
    X_ = zeros(1,N);
    F_ = zeros(1,N);
    for ii = 0:N-1
        X_(ii+1) = x.' * exp(1i * 2 * pi * n.' / N * ii);
        F_(ii+1) = ii;
    end
    X = X_.';
	F = F_.';
end
