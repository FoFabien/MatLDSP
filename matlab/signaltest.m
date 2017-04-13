
% Création d'un signal de test audio

% sinusoide de fréquence croissante
fe=22000;
duree=3;
t=[0:round(fe*duree)]/fe;

if 0
    y=[chirp(t,1,duree,6000),chirp(t,6000,duree,1)];
    
    sound(y*0.5,fe);
    wavwrite(y*0.8,fe,16,'chirp-1-6000Hz.wav');
end

if 0
    f=440;
    y=square(2*pi*t*f);
    sound(y*0.5,fe);
    wavwrite(y*0.8,fe,16,'carre440Hz.wav');
end

if 1
    f=440;
    y=sin(2*pi*t*f);
    sound(y*0.5,fe);
    %wavwrite(y*0.8,fe,16,'sinus440Hz.wav');
end


if 0
    f=220;
    y=sin(2*pi*t*f)+sin(2*pi*t*f*2)+sin(2*pi*t*f*4)+sin(2*pi*t*f*8)+sin(2*pi*t*f*16);
    sound(y*0.5,fe);
    wavwrite(y/3.07,fe,16,'sinus220Hz+harmoniques.wav');
end
