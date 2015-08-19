function y = Math_GaussianBell(varargin)
if (isempty(varargin))
	msgbox({'No arguments provided!';'[y t] = gaussianBell(t, offset, s);'}, 'Error!', 'error', 'modal');
	y = 0;
	return;
end

t = 0;
offset = 0;
s = 0.5;

v = length(varargin);
k = 1;
if (v >= 1)
	t = varargin{k}; k = k + 1;
	if (v >= 2)
		offset = varargin{k}; k = k + 1;
		if (v >= 3)
			s = varargin{k}; k = k + 1;
		end
	end
end

%msgbox({['s = ' num2str(s,4)];['offset = ' num2str(offset,4)];['sampleSize = ' num2str(sampleSize,4)];['width = ' num2str(width,4)]}, 'Error!', 'error', 'modal');
size = length(t);
y = zeros(1, size);
for x = 1:size
	y(x) = Math_GaussianEquation(s, t(x) - offset) * 2*pi*s*s;
end

end