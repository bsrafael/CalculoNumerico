% Sistemas de Equa??es Lineares
% M?todo de Gauss-Jacobi

close all;
clear all;
clc

x1 = [1.0002 2.0086 -2.9978]';
x2 = [0.9994 2.0015 -3.0007]';


% norma euclidiana: 
% n = || sqrt ( a^2 + b^2 + c^2 + ... ) ||
% obter a norma euclidiana
diferenca = x1 - x2;
quadrado = diferenca.^2;
sum(quadrado);

numerador = sqrt(sum((x1-x2).^2));
denominador = sqrt(sum(x2.^2));

ER = numerador / denominador;
