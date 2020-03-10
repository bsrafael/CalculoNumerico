% ZeroBissecao
% Serve para procurar uma raiz em um intervalo [a,b]
% dado que f(a) e f(b) possuam sinais contrários. 
% Itera-se até que o erro relativo seja menor que a tolerância.

close all
clear all
clc

% Entradas
f = @(x)x^2-3;
a = 0;
b = 2;
tol = 1e-10; % tolerancia para o erro relativo, usado para criterio de parada (1e-2 = 0.01 = 1*10^-2)

% Estimativa inicial
k = 1;          % valor inicial para o contador
kmax = 30;      % valor maximo para o contador
x = (a+b) / 2;  % valor inicial para X
fx = f(x);  % F avaliado para X
fa = f(a);  % F avaliado apra o valor B
fb = f(b);  % F avaliado para o valor A
ER = inf;   % erro relativo infinito para entrar no erro de repeticao, maior q a tolerancia

fprintf ('k \t x \t\t\t ER\n');
fprintf('%d \t %f \t %e\n', k, x, ER)

% while ER > tol        % erro relativo maior que a tolerância
% while k < kmax        % limite de numero de tentativas
while abs(f(x)) > tol   % 

    if fa*fx <= 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
    k = k + 1;          % contador do num de iteracoes
    sol = x;            % solucao anterior
    x = (a + b) / 2;    % nova solucao
    fx = f(x);          
    ER = abs ( (x-sol)/x);
    fprintf('%d \t %f \t %e\n', k, x, ER)
    
end




