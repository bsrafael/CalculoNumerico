%Este programa aplica o método de Newton-Cotes composto para o cálculo de
%integrais definidas

close all
clear all
clc

%Limites de integração 
a=1; %limite inferior
b=4; %limite superior

%Ordem de integração
n=2;

%Número de intervalos
m=3;

%Cálculo da largura dos intervalos 
H=(b-a)/m;

%Cálculo da largura dos subintervalos
h=H/n;

%Domínio de integração
x=a:h:b %h=espaçamento

%Valores da função 
y=sqrt(x);
%y=[???] caso eu não conheça a fórmula terei um vetor de pontos

w = PesosInt(n);


%Cálculo da integral
I=0;
for j=1:m
    soma=0;
    for i=1:n+1
        soma=soma+w(i)*y(n*(j-1)+i);
    end
    S(j)=H*soma; %integral parcial
    I=I+S(j); %integral definitiva
end
S 
I
f=@(x)(2*x^(3/2))/3; %calculado com syms x e int(função)
E=f(b)-f(a);
ER=abs((E-I)/E)
%conferir valores das integrais intermediárias no slide (exemplo)
