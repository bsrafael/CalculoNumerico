% metodo de newton para solucoes de eqs nao lineares
% nova aproximação é a antiga menos f(x)/df(x)

close all
clear all
clc


% calcular derivada
% > f = @(x) ...
% > syms x
% > diff(f)

% entradas
f = @(x)x^3 - x - 1;	% funcao
df = @(x)3*x^2-1;       % primeira derivada
x = 1;                  % aproximacao inicial obtida no grafico
tol = 1e-4;             % tolerancia determinada pelo exercicio (10^-4)


% Estimativa inicial
k = 1;      % contador
F = f(x);   % f inicial 
D = df(x);  % df inicial
ER = inf;   % erro relativo inicial

fprintf ('k \t x \t\t\t ER \t delta \n');
fprintf('%d \t %f \t %e \t %e \n', k, x, ER, abs(f(x)) ) 

while abs(f(x))>tol
    k = k+1;
    sol = x;
    x = x - F/D; % nova aproximação é a antiga menos f(x)/df(x)
    
    F = f(x);
    D = df(x);

    
    ER = abs ( (x-sol)/x);
    fprintf('%d \t %f \t %e \t %e \n', k, x, ER, abs(f(x)) ) 
end



