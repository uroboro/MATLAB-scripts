function [ output_args ] = main(varargin)
	output_args = 1;
	
	% argumentos:
	%	modo:
	%		1: Butterworth de ordenMin a ordenMax en Wn
	%		2: Chebyshev de ordenMin a ordenMax en Wn
	%		3: Bessel de ordenMin a ordenMax en Wn
	%		4: Butterworth de ordenMin vs Chebyshev de ordenMax en Wn
	%		5: Butterworth de ordenMin vs Bessel de ordenMax en Wn
	%		6: Chevyshev de ordenMin vs Bessel de ordenMax en Wn
	%	orden: orden minimo / orden del 1er filtro en modo 4-6
	%	orden: orden maximo / orden del 2do filtro en modo 4-6
	%	Wc: w de corte
	%	Rp: Chebyshev Ripple (dB)
	%	af_modo: modo de analisis (mascara de bits)
	%		01: bode y mapa zpk
	%		10: rta a impulso y escalon

	defaults = [1, 1, 1, 1, 3, 3];
	for i = 1:nargin % nargin es el tamaño de vararin
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	
	modo = defaults(1);
	ordenMin = defaults(2);
	ordenMax = defaults(3);
	Wc = defaults(4);
	Rp = defaults(5);
	af_modo = defaults(6);

	a = 'Butterworth n=';
	b = 'Chebyshev n=';
	c = 'Bessel n=';
	
	if (modo >= 1 && modo <= 3)
		strv = cell([(ordenMax-ordenMin) 1]);
	elseif (modo >= 4 && modo <= 6)
		strv = cell([2 1]);
	end

	switch (modo)

	% Butterworth de ordenMin a ordenMax en Wn
	case 1
		for i = ordenMin:ordenMax
			sysv(1 + i-ordenMin) = butterSys(i, Wc);
			strv(1 + i-ordenMin) = {strcat(a, num2str(i))};
		end

	% Chebyshev de ordenMin a ordenMax en Wn
	case 2
		for i = ordenMin:ordenMax
			sysv(1 + i-ordenMin) = cheby1Sys(i, Wc, Rp);
			strv(1 + i-ordenMin) = {strcat(b, num2str(i))};
		end

	% Bessel de ordenMin a ordenMax en Wn
	case 3
		for i = ordenMin:ordenMax
			sysv(1 + i-ordenMin) = besselfSys(i, Wc);
			strv(1 + i-ordenMin) = {strcat(c, num2str(i))};
		end

	% Butterworth de ordenMin vs Chebyshev de ordenMax en Wn
	case 4
		sysv(1) = butterSys(ordenMin, Wc);
		strv(1) = {strcat(a, num2str(ordenMin))};

		sysv(2) = cheby1Sys(ordenMax, Wc, Rp);
		strv(2) = {strcat(b, num2str(ordenMax))};

	% Butterworth de ordenMin vs Bessel de ordenMax en Wn
	case 5
		sysv(1) = butterSys(ordenMin, Wc);
		strv(1) = {strcat(a, num2str(ordenMin))};

		sysv(2) = besselfSys(ordenMax, Wc);
		strv(2) = {strcat(c, num2str(ordenMax))};

	% Chevyshev de ordenMin vs Bessel de ordenMax en Wn
	case 6 
		sysv(1) = cheby1Sys(ordenMin, Wc, Rp);
		strv(1) = {strcat(b, num2str(ordenMin))};

		sysv(2) = besselfSys(ordenMax, Wc);
		strv(2) = {strcat(c, num2str(ordenMax))};

	end
	
	analisis_filtro(sysv, strv, af_modo);
end
