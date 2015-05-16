% Realiza grafico de bode, mapa de polos y ceros, respuesta al impulso y
% respuesta al escalon de un sistema.
%
% Input:
% sysv: vector de sistemas (ej: sys = zpk())
% legend_str: vector de strings
%
% Ambos vectores deben tener la misma cantidad de elementos

function analisis_filtro(sysv, legend_str)
	N = length(legend_str);

	figure('Name', 'Bode y Polos-Zeros');
	% BODE
	subplot(1,2,1);
	hold on;
	for i=1:N
		bode(sysv(i));
	end
	legend(legend_str);
	grid on;
	hold off;

	%POLOS Y CEROS
	subplot(1,2,2);
	hold on;
	for i=1:N
		pzmap(sysv(i));
	end
	legend(legend_str);
	grid on;
	hold off; 

	figure('Name', 'Impulse y Step');
	%RESPUESTA AL IMPULSO
	subplot(1,2,1);
	hold on;
	for i=1:N
		impulse(sysv(i));
	end
	legend(legend_str);
	grid on;
	hold off;

	%RESPUESTA AL ESCALON
	subplot(1,2,2);
	hold on;
	for i=1:N
		step(sysv(i));
	end
	legend(legend_str);
	grid on;
	hold off;

end