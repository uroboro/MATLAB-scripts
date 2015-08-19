% Generate dual sine phone tone for a given key
%	key: phonepad key: (0-9, *, #, A-D)
%	samples: samples quantity
%	sampleRate: Sample
function [ data, time ] = Telephony_PhoneTone(samples, samplingFrequency, key)
	[fA, fB] = Telephony_PhoneFrequenciesForButton(key);
	[ data1, time1 ] = Signal_GenerateSine(samples, samplingFrequency, 1, fA);
	[ data2, time2 ] = Signal_GenerateSine(samples, samplingFrequency, 1, fB);
	data = data1 + data2;
	time = time1 + time2;
end
