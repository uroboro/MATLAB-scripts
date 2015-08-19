function t = Math_GaussianEquation(varargin)
if (isempty(varargin))
	msgbox('No dimensions provided', 'Error!', 'error', 'modal');
	t = 0;
	return;
end

n = length(varargin);
s = varargin{1};
z = 0;
for i = 2 : n
	Z = varargin{i};
	z = z + Z * Z;
end

t = 1/(2*pi*s*s*exp(z/(2*s*s)));

end