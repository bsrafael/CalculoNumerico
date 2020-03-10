% metodo de newton para solucoes de eqs nao lineares
% nova aproximação é a antiga menos f(x)/df(x)

close all
clear all
clc


% calcular derivada
% > f = @(x) ...
% > syms x
% > diff(f(x))

% entradas
f = @(x)x * exp(-x) - 0.2;      % funcao
df = @(x)exp(-x) - x*exp(-x);	% primeira derivada
x = 0.5;                          % aproximacao inicial obtida no grafico
tol = 1e-15;                     % tolerancia determinada pelo exercicio (10^-4)


% Estimativa inicial
k = 1;      % contador
kmax = 4;   % maximo
F = f(x);   % f inicial 
D = df(x);  % df inicial
ER = inf;   % erro relativo inicial

fprintf ('k \t x \t\t\t ER \t delta \n');
fprintf('%d \t %f \t %e \t %e \n', k, x, ER, abs(f(x)) ) 

while k < kmax
    k = k+1;
    sol = x;
    x = x - F/D; % nova aproximação é a antiga menos f(x)/df(x)
    
    F = f(x);
    D = df(x);

    
    ER = abs ( (x-sol)/x);
    fprintf('%d \t %f \t %e \t %e \n', k, x, ER, abs(f(x)) ) 
end



