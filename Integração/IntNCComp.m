%Este programa aplica o m�todo de Newton-Cotes composto para o c�lculo de
%integrais definidas

close all
clear all
clc

%Limites de integra��o 
a=1; %limite inferior
b=4; %limite superior

%Ordem de integra��o
n=2;

%N�mero de intervalos
m=3;

%C�lculo da largura dos intervalos 
H=(b-a)/m;

%C�lculo da largura dos subintervalos
h=H/n;

%Dom�nio de integra��o
x=a:h:b %h=espa�amento

%Valores da fun��o 
y=sqrt(x);
%y=[???] caso eu n�o conhe�a a f�rmula terei um vetor de pontos

w = PesosInt(n);


%C�lculo da integral
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
f=@(x)(2*x^(3/2))/3; %calculado com syms x e int(fun��o)
E=f(b)-f(a);
ER=abs((E-I)/E)
%conferir valores das integrais intermedi�rias no slide (exemplo)
