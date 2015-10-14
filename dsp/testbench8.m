egc_L = length(ecg_lead);
D = 1;
R = 0 + (1:floor(egc_L/D));
ecg = ecg_lead(R);

qi = qrs_detections;
qi_L = length(qi);
Qi = zeros(qi_L, 1);
for i = 1:qi_L
	if (qi(i) > length(R))
		break;
	end;
	Qi(i) = ecg(qi(i));
end
qi = qi(1:i);
Qi = Qi(1:i);

X = [0; qi];
for i = 1:qi_L
	X(i) = X(i+1) - X(i);
end
X = X(1:qi_L);
qi_min = min(X);
plot(X); text(50, qi_min - 50, strcat('min=',num2str(qi_min)));
clear X;

X = zeros(qi_min+1,qi_L);
for n = 1:qi_L
	x_ = zeros(qi_min,1);
	for i = -floor(qi_min/2) : floor(qi_min/2)
		n_ = n + i;
		if (n_ < 1)
			n_ = qi_L + n_;
		elseif (n_ > qi_L)
			n_ = n_ - qi_L;
		end
		x_(i + floor(qi_min/2) + 1) = ecg(qi(n_)+i);
	end
	X(:,n) = x_;
end
plot(X);


if (0)
	plot(ecg);
	%axis([R(1), R(end), min(ecg), max(ecg)]);
	hold on;
	plot(my_median(ecg, 20));
	plot(qi, Qi);
	hold off;
end
