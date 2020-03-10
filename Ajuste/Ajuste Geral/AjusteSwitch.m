clear all
close all
clc

% Dados de entrada
x = [0.5 2.8 4.2 6.7 8.3]';
y = [4.4 1.8 1 0.4 0.2]';


% grau do polinomio de ajuste
gr = 1;


% funcao de ajuste
% 1 => polinomio
% 2 => exponencial
% 3 => potencia
ajuste = 2;

switch ajuste
    case 1
        xnew = x;
        ynew = x;
%         ystar = X*a;
    case 2
        xnew = x;
        ynew = log(y);
    case 3
        % xnew = ?
        % ynew = ?
        disp('TODO: case 3');
    otherwise
        disp('ERRO: ajuste nao encontrado');
end



% Matriz de planejamento
X = MVanderFunction(xnew, gr);
A = X'*X;
b = X'*ynew;

% funcao de ajuste
a = SLGaussFunction(A,b);

switch ajuste
    case 1
        ystar = X*a;
    case 2
        m = a(1);
        b = exp(a(1));
    case 3
        % y = b*x^m
        m = a(1);
        b = exp(a(2));
        ystar = b*x.^m;
end


% Determinacao do Residuo Quadratico 
ya = X*a;
Sqe = sum((y-ya).^2);


% grafico
% pontos usados no ajuste
plot(x,y, 'ob', 'markersize', 12)
hold on
dominio = x(1):0.1:x(end); % primeiro valor de x ao ultimo, de 0.1 em 0.1


switch ajuste
    case 1
        X = MVanderFunction(dominio, gr); % nova matriz de planejamento com + linhas
        imagem = X*a;
    case 2
        imagem = b*exp(m*dominio);
    case 3
        disp('TODO: grafico case 3');
    otherwise
        disp('ERRO: ajuste nao encontrado');
end
        

plot(dominio, imagem, 'k-', 'linewidth', 2)
grid


        
        
     