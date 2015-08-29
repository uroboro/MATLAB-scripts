%IMEQLIN Limear equalization of an images histogram
%Syntax
%	[ imgOut ] = imeqlin( img )
function [ imgOut ] = imeqlin( img )
	imgOut = img;
	ha = imhistac(img);

	[rows, cols] = size(img);
	for x = 1:1:rows
		for y = 1:1:cols
			val = img(x, y);
			imgOut(x, y) = (255 / (rows * cols)) * ha(val + 1);
		end
	end
end

