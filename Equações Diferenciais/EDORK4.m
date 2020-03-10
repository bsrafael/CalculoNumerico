% metodo de Rungee Kutta de quarta ordem

clear all;
close all;
clc;
format short;


% Entrada: F, a, b, ya, h
% Saida: x, y


% definicao da funcao f(x,y)
f = @(x,y) 1+x-2*y; % ex1 slides eq diferenciais


% dominio da solucao
a = 0;
b = 1;



% h = tamanho do passo
h = 0.2;

% n = numero de passos, precisa ser inteiro
n = floor((b-a)/h) + 1;

x = zeros(1, n);
y = zeros(1, n);

% condicao inicial
% matematicamente se escreveria " y(x=a)) = 3
x(1) = a;
y(1) = 1;


% Determinacao de y(x)
% calcular o valor de x para o ponto atual
% com base no ponto atual calcula-se o proximo
for i=1:n-1
    k1 = f(x(i), y(i));
    k2 = f( x(i)+h/2, y(i)+k1*h/2 );
    k3 = f( x(i)+h/2, y(i)+k2*h/2 );
    k4 = f(x(i)+h, y(i)+k3*h);
    k = (k1+ 2*k2 + 2*k3 + k4) / 6;
       
    
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + k*h;
end

x
y


% resolvendo a EDO
% syms y(x);
% eqdif = diff(y,x) == -1.2*y + 7*exp(-0.3*x);
% cond = y(0) == 3;
dom = a:0.1:b;
% img = ;

sol = @(x) x/2 + (3*exp(-2*x))/4 + 1/4;
Erro = max(abs(y-sol(x)))
img = sol(dom);

plot (dom, img, 'k-', 'linewidth', 2);
hold on
plot(x,y,'--r', 'linewidth', 2);
grid
% axis([0 2.5 3 4.5])
