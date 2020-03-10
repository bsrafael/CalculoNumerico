% Metodo de Spline Cubico para interpolar (determinar) uma estmativa 

close all;
clear all;
clc;
format short

% entrada das coordenadas dos pontos
x = [0 1 4 6]';
y = [1 2.3 2.2 3.7]';


v = CoefSpline3Function(x,y)


% resultado desse exemplo:
% cada linha sao os coeficientes de um spline
% -0.2209         0    1.5209    1.0000
%  0.1218   -0.6627    0.8582    2.3000
% -0.0723    0.4338    0.1716    2.2000

% Sk - ak(x - xk)^3 + bk(x - xk)^2 + ck(x - xk) + dk
% Onde k eh o valor inicial dos possiveis intervalos de x
% Portanto:
% S1(x) = -0.2209(x - 0)^3  + 1.5209(x - 0) + 1                 0 < x < 1
% S2(x) = 0.1218(x-1)^3 - 0.6627(x-1)^2 + 0.8582(x-1) + 2.3     1 < x < 4
% S3(x) = -0.0723(x-1)^3 - 0.4338(x-1)^2 + 0.1716(x-1) + 2.2    4 < x < 6

% Por exemplo, quero estimar para x = 5, entao uso o terceiro spline


