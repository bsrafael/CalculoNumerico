%Este programa permite a identifica��o de fun�oes de ajuste polinomial,...

clear all
close all
clc

%Dados de entrada
x=[2005:2016]';
y=[27 28.6 30.5 32.2 33.6 36.2 38.3 39.6 40.8 41.2 39.7 38.3]';

%Grau do Polinomio de ajuste
gr=3;

%Fun��o de Ajuste
%1=>polin�mio
%2=>exponencial
%3=>pot�ncia
ajuste=1;

switch ajuste
    case 1
        xnew=x;
        ynew=y;
    case 2
        xnew=x;
        ynew=log(y);
    case 3 
        xnew=log(x);
        ynew=log(y);
    otherwise
        disp('Escolha a op��o correta')
end
    

%Matriz de planejamento
X = MVander(xnew,gr);
%Resolu��o do sistema linear
A=X'*X;
b=X'*ynew;
a=SLGauss_Function(A,b)

%Determina��o do Res�duo quadr�tico
switch ajuste
    case 1 
        ya=X*a;
    case 2
        m=a(1)
        b=exp(a(2))
        ya=b*exp(m*x);
    case 3
       m=a(1)
       b=exp(a(2))
       ya=b*x.^m;
    otherwise
        disp('ERRO!!!')
end

Sqe=sum((y-ya).^2)

%Gr�fico
plot(x,y,'ob','markersize',12)
hold on
dom=x(1):0.1:x(end);
switch ajuste
    case 1 
        X = MVander(dom,gr);
        img=X*a;
    case 2 
        img=b*exp(m*dom);
    case 3 
       img=b.*dom.^m; 
    otherwise
        disp('ERRO')
        
end
plot(dom,img,'k-','linewidth',2)
grid