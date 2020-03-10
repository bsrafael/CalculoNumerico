function w = PesosInt(n)
%Esta função calcula os pesos da ordem de integração n
%na quadratura de Newton-Cotes 

%Construção da Matriz 'C' e vetor 'd'
if n==0
    w=1
else
    C=zeros(n+1,n+1);
    d=zeros(n+1,1);
    for i=1:n+1
        for j=1:n+1
            C(i,j)=((j-1)/n)^(i-1);
        end
        d(i)=1/i;  
    end
end

%Solução do SEL
w = SLGauss_Function(C,d);
end
%format rat = joga os valores na tela em forma de fração
%ordem 2: dois pontos
%ordem 3 em um determinado intervalo: 3 pontos...
