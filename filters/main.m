function [ output_args ] = main(varargin)
    output_args = 1;
    
    % argumentos:
	%	modo:
	%	orden: orden minimo / orden del 1er filtro en modo 4-6
	%	orden: orden maximo / orden del 2do filtro en modo 4-6
	%	Wc: w de corte
	%	Rp: Chebyshev Ripple (dB)
    defaults = [1, 1, 1, 1, 1];
	for i = 1:nargin % nargin es el tamaño de vararin
        % copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
    
	modo = defaults(1);
    ordenMin = defaults(2);
	ordenMax = defaults(3);
	Wc = defaults(4);
	Rp = defaults(5);

	a = 'butterworth orden-';
	b = 'chebyshev orden-';
	c = 'bessel orden-';
    
    strv={};

	switch (modo)

	% Butterworth de ordenMin a ordenMax en Wn
	case 1
		for i = ordenMin:ordenMax
			sysv(1 + i-ordenMin) = butterSys(i, Wc);
			titulo = {'butterworth'};
			strv = [strv; strcat( titulo ,' - orden ', num2str(i) )];
		end

	% Chebyshev de ordenMin a ordenMax en Wn
	case 2
		for i = ordenMin:ordenMax
			sysv(1 + i-ordenMin) = cheb1Sys(i, Wc, Rp);
			titulo = {'chebyshev'};
			strv = [strv; strcat( titulo ,' - orden ', num2str(i) )];
		end

	% Bessel de ordenMin a ordenMax en Wn
	case 3
		for i = ordenMin:ordenMax
			sysv(1 + i-ordenMin) = besselfSys(i, Wc);
			titulo = {'bessel'};
			strv = [strv; strcat( titulo ,' - orden ', num2str(i) )];
		end

	% Butterworth de ordenMin vs Chebyshev de ordenMax en Wn
	case 4
		sysv(1) = butterSys(ordenMin, Wc, 's');
		sysv(2) = cheb1Sys(ordenMax, Wc, Rp);
		strv = {strcat(a, num2str(ordenMin)); strcat(b, num2str(ordenMax))};

	% Butterworth de ordenMin vs Bessel de ordenMax en Wn
	case 5
		sysv(1) = butterSys(ordenMin, Wc, 's');
		sysv(2) = besselfSys(ordenMax, Wc);
		strv = {strcat(a, num2str(ordenMin)); strcat(c, num2str(ordenMax))};

	% Chevyshev de ordenMin vs Bessel de ordenMax en Wn
	case 6 
		sysv(1) = cheby1Sys(ordenMin, Wc, Rp, 's');
		sysv(2) = besselfSys(ordenMax, Wc);
		strv = {strcat(b, num2str(ordenMin)); strcat(c, num2str(ordenMax))};
	end
	
	analisis_filtro(sysv, strv);
end
