% Play a key for a time and silence for another time.
function UFS_PlayKeyForTimeAndSpace(k, time, space)
	if (time < 0)
		return;
	end
	WAV_Tone = UFS_PhoneTone(k, time);
	%wavplay(WAV_Tone, WAV_Fs);
	p = audioplayer(WAV_Tone, UFS_Fs());
	%get(p)
	playblocking(p);
	if (space > 0)
		pause(space);
	end
end

