% Generate dual sine phone tone for a given key
%	key: phonepad key: (0-9, *, #, A-D)
%	samples: samples quantity
%	sampleRate: Sample
function [ data ] = Telephony_PhoneTone(key, samples, sampleRate)
	t = 0 : 1 / sampleRate : (samples - 1) / sampleRate;
	[fA, fB] = Telephony_PhoneFrequenciesForButton(key);
	data = UFS_PureTone(fA, 0.875, t) + UFS_PureTone(fB, 0.875, t);
end
