% Autor: CARLOS ALEXANDRE ROLIM FERNANDES
% Revisado por: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computação
%
% Script para exemplificar filtro passa baixa

clc
clear
close

% Parametros
M = 50; %Numero de pontos
wc = 0.5*pi; %Frequencia de corte
n = 0:M; %Tempo discreto
nd = M/2; 

% RI do filtro PB
h = sin(wc*(n-nd))./(pi*(n-nd)); %Resposta ao impulso
h(M/2+1) = wc/pi; %Resposta ao impulso
stem(h) %Plota a resposta ao impulso

% RF do filtro PB
H = fftshift(fft(h,M)); %T.F da resposta ao impulso(Resposta em Frequencia)
figure,plot(linspace(-pi,pi,length(H)),abs(H)) %plota a Resposta em frequencia