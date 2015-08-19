% Generate silence for a given time.
function silence = UFS_Silence(t)
% t = 1 == 1ms
	WAV_Fs = UFS_Fs();
	samples = t * (WAV_Fs / 1000);
	t = linspace(0, (samples - 1) / WAV_Fs, samples);
	silence = UFS_PureTone(0, t, 0);
end

