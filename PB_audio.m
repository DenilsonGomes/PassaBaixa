% Autor: CARLOS ALEXANDRE ROLIM FERNANDES
% Revisado por: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computação
%
% Script para exemplificar filtro passa baixa

clear
close all
clc

[y,Fs]= audioread('botao.wav'); %Carrega o audio
% load train  %Carrega o audio
% load chirp  %Carrega o audio

y = y(:,1);
y = y(1:5:end);
Fs = Fs/5;
plot(y) %Plota o sinal
tempo_vec = (1:length(y)); %tempo
ylabel('Amplitude do Sinal')
xlabel('Tempo discreto')

% Transformada de Fourier
Yw = fftshift(fft(y)); %TF
freq_vec = linspace(-pi,pi,length(y)); %Frequencias
figure,plot(freq_vec,abs(Yw),'b') %Plota a TF do sinal
ylabel('Espectro de magnitude')
xlabel('Frquencia em Rad/se')

% sound(y,Fs)


% Filtragem
wc1 = 0.08*pi; %Frquencia de conrte
[B,A] = butter(10, wc1/pi);
[H,W] = freqz(B,A,length(y));
figure,plot(W,abs(H)) %Plota filtro Passa-Baixa
y_filt = filter(B,A,y);
figure,plot(real(y_filt)) %Plota o sinal filtrado
ylabel('Amplitude do Sinal Filtrado')
xlabel('Tempo discreto')
% axis([0 6e4 -1.1 1.1])
% sound(real(y_filt),Fs)
% zplane(B,A)


Yw_filt = fftshift(fft(y_filt));
freq_vec = linspace(-pi,pi,length(Yw_filt));
figure,plot(freq_vec,abs(Yw_filt)) %Plota TF do sinal filtrado
ylabel('Espectro de magnitude do Sinal Filtrado')
xlabel('Frquencia em Rad/s')