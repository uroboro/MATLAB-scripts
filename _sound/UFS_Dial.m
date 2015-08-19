function UFS_Dial(number, varargin)
	defaults = [ 100, 0.01 ];
	argc = length(varargin);
	for i=1:argc
		if (varargin{i} < 0)
			continue
		end
		defaults(i) = varargin{i};
	end
	time = defaults(1);
	space = defaults(2);
	for k = number
		UFS_PlayKeyForTimeAndSpace(k, time, space);
	end
end