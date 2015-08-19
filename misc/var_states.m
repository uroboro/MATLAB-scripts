%%%%%%%%%%%%%%%%%%%%%%%
% Variables de estado %
%%%%%%%%%%%%%%%%%%%%%%%

function var_states()
	T = [0, 1*10^-3];
	[xi xf] = Ci();
	[t, x] = ode45(@Ec_RLC, T, [xi xf]);
	Y = Ec_RLC2(t, x); Y = Y';
	figure('Name', 'b', 'NumberTitle', 'off', 'Position', [50 50 1000 600]);
	subplot(2,1,1);
	h = plot(t, [Vi(t) Y(:,1) Y(:,2)]);
	legend(h, 'Vi', 'V0', 'VL', 'location', 'BestOutside');
	subplot(2,1,2);
	h = plot(t, [Y(:,3) Y(:,4) Y(:,5)]);
	legend(h, 'iL', 'iC', 'iR', 'location', 'BestOutside');
end

function Xp = Ec_RLC(t, X)
	[A B C D] = ABCD();
	Xp = A * X + B * Vi(t);
end

function Y0 = Ec_RLC2(t, x)
	[A B C D] = ABCD();
	Y0 = zeros(length(D), length(t));
	for j = 1:length(t)
		Y0(:,j) = C * x(j,:)' + D * Vi(t(j));
	end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables especificas del circuito %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [A B C D] = ABCD()
	[R L C] = RLC();
	A = [ 0 1/C; -1/L -R/L ];
	B = [ 0 ; 1/L ];
	C = [1 0; -1 -R; 0 1; 0 1; 0 1];
	D = [0; 1; 0; 0; 0];
end

function [R L C] = RLC()
	R = 1*10^3;
	L = 43*10^-3;
	C = 33*10^-9;
end

function Vi = Vi(t)
	Vi = 1 * t.^0; % es importante "t.^0" ya que mantiene el tamanio de t
end

function [vi il] = Ci()
	vi = 0; il = 0;
end