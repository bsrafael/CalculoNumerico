% este programa permite a identificacao de funcoes de ajuste polinomial

clear all
close all
clc

% Dados de entrada
x = [0.5 2.8 4.2 6.7 8.3]';
y = [4.4 1.8 1 0.4 0.2]';

% grau do polinomio de ajuste
gr = 1; 


% Matriz de planejamento
X = MVanderFunction(x, gr);

A = X'*X;
b = X'*y;

% funcao de ajuste
a = SLGaussFunction(A,b)


% Determinacao do Residuo Quadratico 
ya = X*a;
Sqe = sum((y-ya).^2);


% grafico
% pontos usados no ajuste
plot(x,y, 'ob', 'markersize', 12)
hold on
dominio = x(1):0.1:x(end); % primeiro valor de x ao ultimo, de 0.1 em 0.1
X = MVanderFunction(dominio, gr); % nova matriz de planejamento com + linhas
imagem = X*a;
plot(dominio, imagem, 'k-', 'linewidth', 2)
grid

