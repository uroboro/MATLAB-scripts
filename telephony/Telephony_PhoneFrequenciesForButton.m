% Get frequency pair for button
%	key: phonepad key: (0-9, A-D, *, #)
function [a, b] = Telephony_PhoneFrequenciesForButton(key)
	% fuente: http://es.wikipedia.org/wiki/Marcaci%C3%B3n_por_tonos
	switch key
	case '1'
		a = 697;
		b = 1209;
	case '2'
		a = 697;
		b = 1336;
	case '3'
		a = 697;
		b = 1477;
	case 'A'
		a = 697;
		b = 1633;
	case '4'
		a = 770;
		b = 1209;
	case '5'
		a = 770;
		b = 1336;
	case '6'
		a = 770;
		b = 1477;
	case 'B'
		a = 770;
		b = 1633;
	case '7'
		a = 852;
		b = 1209;
	case '8'
		a = 852;
		b = 1336;
	case '9'
		a = 852;
		b = 1477;
	case 'C'
		a = 852;
		b = 1633;
	case '*'
		a = 941;
		b = 1209;
	case '0'
		a = 941;
		b = 1336;
	case '#'
		a = 941;
		b = 1477;
	case 'D'
		a = 941;
		b = 1633;
	end
end