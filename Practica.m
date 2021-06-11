[s,fs] = audioread('Prueba1.wav');

tiempo = size(s,1)/fs;
x = 0:1/fs:tiempo;

plot(x(2:end),s), xlim([0 tiempo]);

l = s(:,1);
r = s(:,2);

sound(l,fs+25000); %Suma
pause(4);
sound(l+1,fs); 
pause(4);
sound(l,fs-25000); %Resta
pause(7);
sound(l-1,fs);
pause(4);
sound(l*10,fs); %Amplificación
pause(4);
sound(l/5,fs); %Atenuación
pause(4);