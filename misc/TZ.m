clear all
Num=[1 1]; %z+1
Den=[1 0]; %z+0
H=tf(Num,Den,1); %transfer function 
 
n=0:63; %creamos un vector de 64 muestras
h=impulse(H,n); %calculamos la respuesta al impulso
g=step(H,n); %calculamos la respuesta al escalón 
 
figure(1); %dibujamos ambas respuestas
subplot(2,1,1);
stem(h);
title('Respuesta al impulso'); 
 
subplot(2,1,2);
stem(g);
title('Respuesta al escalón'); 
 
figure(2); %dibujamos el diagrama de polos y ceros
pzmap(H);
 
figure(3) %dibujamos la respuesta en frecuencia
[Hw,w]=freqz(Num,Den);
subplot(2,1,1);
plot(w,abs(Hw));
title('Respuesta de módulo');
subplot(2,1,2);
plot(w,angle(Hw));
title('Respuesta de fase');
