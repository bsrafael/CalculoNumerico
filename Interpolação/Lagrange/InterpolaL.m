% Metodo de Lagrange para interpolar (determinar) uma estmativa 

close all;
clear all;
clc;
format short

% entrada das coordenadas dos pontos
x = [0 1 4 6]';
y = [1 2.3 2.2 3.7]';
% "qual o U que eu quero estimar? precisa estar dentro do dom?nio observado"
% u = [0.5 1.28 3.4 4.9 5 6];
u = x(1):0.1:x(end);

v = ILagrangeFunction(x,y,u);

plot(x,y,'*b','markersize',12)
hold on
plot(u,v,'-k','linewidth',2); % plot do valor aproximado
grid