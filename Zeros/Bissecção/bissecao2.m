% bissecao2

close all
clear all
clc





% Entradas
f = @(x) x^3 - 9*x + 3;

ezplot(f)
grid

a = 2;
b = 4;
tol = 1e-8; % tolerancia para o erro relativo, usado para criterio de parada (1e-2 = 0.01 = 1*10^-2)

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
% while abs(f(x)) > tol   % 
while ER > tol
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







