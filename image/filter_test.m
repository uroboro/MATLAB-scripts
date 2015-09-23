%function [ output_args ] = filter_test( input_args )
%FILTER_TEST Summary of this function goes here
%   Detailed explanation goes here
	I = imread('cameraman.tif');

	figure(1); i = 1;
	displayRows = 2;
	displayCols = 3;

	subplot(displayRows, displayCols, i); i = i + 1;
	title('Original');
	imshow(I);

% 	tic;
% 	subplot(displayRows, displayCols, i); i = i + 1;
% 	title('soft');
% 	imshow(Image_Blur(I,5));
% 	timeA = toc
 
% 	tic;
% 	subplot(displayRows, displayCols, i); i = i + 1;
% 	title('soft2');
% 	imshow(Image_Blur2(I,5));
% 	timeB = toc

% 	tic;
% 	subplot(displayRows, displayCols, i); i = i + 1;
% 	title('Gaussian');
% 	imshow(Image_Gaussian(I,5));
% 	timeC = toc

% 	tic;
% 	subplot(displayRows, displayCols, i); i = i + 1;
% 	title('Laplaciano');
% 	k = ones(5) / 5^2;
% 	imshow(Image_Laplaciano(I,5));
%	timeD = toc

	tic;
	subplot(displayRows, displayCols, i); i = i + 1;
	title('Laplaciano');
	k = ones(5) / 5^2;
	imshow(Image_Salt_Pepper(I,100));
	timeE = toc

%end
