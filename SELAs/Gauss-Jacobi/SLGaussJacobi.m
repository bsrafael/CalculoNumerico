% M?todo de Gauss-Jacobi para solu??o de sistemas de equa??es lineares

close all;
clear all;
clc;

% Express?o geral:  Ax = b
% No m?todo:         x = Cx + d

% Dados de entrada:
A = [5 1 1; 3 4 1; 3 3 6]; % Matriz de coeficientes

% Termos independentes
b = [5 6 0]';

% tolerancia
tol = 1e-5;

% Maximo de repeticoes
kmax = 10;


% Matriz e vetor de itera??o
n = size(A,1);      % n?mero de linhas da matriz A
C = zeros(n);       % matriz quadrada de N linhas e N colunas, zerada
d = zeros(n, 1);    % matriz de n linhas e 1 coluna, zerada


for i = 1:n
    for j = 1:n
       if i ~= j
           C(i,j) = -A(i,j)/A(i,i);
       end
    end
    d(i) = b(i)/A(i,i);
end

% Processo iterativo
x = ones(n,1);      % vetor solu??o inicial: matriz de n linhas e 1 coluna, inicializada com 1
k = 1;
ER = inf;
Delta = inf;

fprintf ('k \t\t x \t\t\t ER \t Delta \n')
fprintf ('%d \t %f \t %f \t %f \t %e \t %e \n', k, x, ER, Delta)
% while (k< kmax)
while (Delta > tol)
   k = k + 1;
   sol = x;
   x = C*x + d; % novo vetor X ? o velho + d
   
   ER = sqrt(sum((sol-x).^2)) / sqrt(sum(x.^2));
   Delta = sqrt(sum((A*x-b).^2))/sqrt(sum(b.^2));
   
   fprintf ('%d \t %f \t %f \t %f \t %e \t %e \n', k, x, ER, Delta)
end

x;
ER;