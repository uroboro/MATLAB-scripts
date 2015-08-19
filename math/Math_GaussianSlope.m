function y = Math_GaussianSlope(varargin)
if (isempty(varargin))
	msgbox({'No arguments provided!';'[y t] = gaussianBell(t, offset, scale);'}, 'Error!', 'error', 'modal');
	y = 0;
	return;
end

t = 0;
offset = 0;
scale = 1;

v = length(varargin);
k = 1;
if (v >= 1)
	t = varargin{k}; k = k + 1;
	if (v >= 2)
		offset = varargin{k}; k = k + 1;
		if (v >= 3)
			scale = varargin{k}; k = k + 1;
		end
	end
end

size = length(t);
y = zeros(1, size);
for x = 1:size
	if (t(x) - offset < 0)
		y(x) = 0;
	else
		y(x) = (t(x) - offset) * exp(-scale*(t(x) - offset)) * scale/0.3679;
	end
end

end