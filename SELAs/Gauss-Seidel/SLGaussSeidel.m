% M?todo de Gauss-Seidel
close all;
clear all;
clc


% Dados de entrada:
A = [5 1 1; 3 4 1; 3 3 6]; % Matriz de coeficientes

% Termos independentes
b = [5 6 0]';

% tolerancia
tol = 1e-5;

kmax = 60;

% Par?metros
n = size(A,1); % n?mero de linhas em A
C = zeros(n);
d = ones(n, 1);


for i = 1:n
    for j = 1:n
        if i ~= j
            C(i,j) = -A(i,j)/A(i,i);
        end
    end
    d(i) = b(i)/A(i,i);
end

% processo iterativo
k = 1;
x = ones(n,1);
ER = inf;
Delta = inf;

fprintf ('k \t x \t\t\t\t\t\t ER \t\t Delta \n')
fprintf ('%d \t %f \t %f \t %f \t %e \t %e \n', k, x, ER, Delta)
% while k < kmax
while (Delta > tol)
    k = k + 1;
    sol = x;
    for i=1:n
        x(i) = C(i,:)*x+d(i);
    end
    ER = sqrt(sum((sol-x).^2)) / sqrt(sum(x.^2));
    Delta = sqrt(sum((A*x-b).^2))/sqrt(sum(b.^2));
    fprintf ('%d \t %f \t %f \t %f \t %e \t %e \n', k, x, ER, Delta)
end
