% Sets normal frequency as base for other functions.
function f = UFS_Fs(varargin)
	persistent F;
	if (isempty(F))
		F = 8000;
	end
	if (nargin > 0)
		F = varargin{1};
	end
	f = F;
end

