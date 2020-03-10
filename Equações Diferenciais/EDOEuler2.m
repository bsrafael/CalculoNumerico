% metodo de euler
clear all;
close all;
clc;
format short;


% Entrada: F, a, b, ya, h
% Saida: x, y


% definicao da funcao f(x,y)
f = @(x,y) -1.2*y + 7*exp(-0.3*x); % ex1 slides eq diferenciais


% dominio da solucao
a = 0;
b = 2.5;



% h = tamanho do passo
h = 0.01;

% n = numero de passos, precisa ser inteiro
n = floor((b-a)/h) + 1;

x = zeros(n, 1);
y = zeros(n, 1);

% matematicamente se escreveria " y(x=a)) = 3
x(1) = a;
y(1) = 3;


% Determinacao de y(x)
% calcular o valor de x para o ponto atual
% com base no ponto atual calcula-se o proximo
for i=1:n-1
    k = f(x(i), y(i));
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + k*h;
end

% x'
% y'


% resolvendo a EDO
% syms y(x);
% eqdif = diff(y,x) == -1.2*y + 7*exp(-0.3*x);
% cond = y(0) == 3;
dom = a:0.1:b;
img = (70*exp(-(6*dom)/5).*exp((9*dom)/10))/9 - (43*exp(-(6*dom)/5))/9;

plot (dom, img, 'k-', 'linewidth', 2);
hold on
plot(x,y,'--r', 'linewidth', 2);
grid
% axis([0 2.5 3 4.5])
