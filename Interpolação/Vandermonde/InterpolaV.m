% Metodo de Vandermonde para determinar um polinomio interpolador
% Polinomio interpolador passa pelos pontos coletados

close all;
clear all;
clc;
format short

x = [0 1 4 6]';
y = [1 2.3 2.2 3.7]';


% Construcao da Matriz de Vandermonde
n = length(x);
m = n - 1;


X = MVanderFunction(x, m);
c = SLGaussFunction(X,y); % vetor de coeficientes que resolvem a matriz de vandermonde

u = 5;
v = polyval(c, u);

%Grafico
plot(x,y,'*b','markersize',12); 
xa=x(1):0.1:x(n); % range de valores de x at? o fim do vetor com espa?amento 0.1
ya=polyval(c,xa); % avalia para cada elemento em xa o valor ya correspondente no polin?mio c
hold on % manter o gr?fico do anterior at? um "hold off"
plot(xa,ya,'k-','linewidth',2); % plot dos pontos
plot(u,v,'*r','markersize',12); % plot do valor aproximado
grid

v