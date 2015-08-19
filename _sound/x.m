%tones = struct('n', '1', 't', 0, 's', 0);
notes1 = '654444444565';
notes2 = '654444444658';
notes3 = '65412366666';
notes4 = '544566666654';
notes = [notes1, notes1, notes2, notes3, notes4];
times1 = [1,1,1,2,1,1,2,1,1,2,1,2];
times2 = [1,1,1,2,1,1,2,1,1,2,2,2];
times3 = [1,1,1,3,1,2,1,1,1,1,2];
times4 = [1,1,2,1,2,1,1,1,1,2,1,2];
times = [times1, times1, times2, times3, times4];
spaces = 50 .* ones(length(times));

pt = UFS_PhoneTone(notes(1), 200 * times(1));
for i = 2:length(times)
	pt = [ pt, UFS_PhoneTone(notes(i), 200 * times(i)), UFS_Silence(spaces(i))];
end

p = audioplayer(pt, UFS_Fs());
playblocking(p);
clear;