load('TP3_ecg.mat');
egc_L = length(ecg_lead);
D = 1;
R = 0 + (1:floor(egc_L/D));
clear D;
ecg = ecg_lead(R);

qi = qrs_detections;
qi_L = length(qi);

%obtener distancia minima entre qrs
X = [0; qi];
for i = 1:qi_L
	X(i) = X(i+1) - X(i);
end
qi_min = min(X);
%plot(X); text(50, qi_min - 50, strcat('min=',num2str(qi_min)));
clear X;

X = zeros(qi_min+1,qi_L);
i = -floor(qi_min/2) : floor(qi_min/2);
for n = 1:qi_L
	X(:,n) = ecg(qi(n) + i + 1);
end; clear n i;
plot(X);

M = mean(X);
for n = 1:qi_L
	X(:,n) = X(:,n) - M(n);
end; clear n;
clear M;
figure;
plot(X);

clear egc_L D R qi qi_L Qi qi_min X;
if (0)
	plot(ecg);
	%axis([R(1), R(end), min(ecg), max(ecg)]);
	hold on;
	plot(my_median(ecg, 20));
	plot(qi, Qi);
	hold off;
end
