function x = SLGaussFunction(A,b)

% Entrada - matriz coeficientes e vetor termos independentes

n = size(A,1);
C = [A b];


% etapa 1 - escalonamento
%   transformar em estrutura triangular superior
%   varre-se as colunas ate n-1 pois nao e necessario ir ate a coluna n
%   zera-se abaixo do pivo ate o final
for j = 1:n-1   % colunas
    C = PivotaParcialFunction(C, n, j);
    for i = j+1:n % linhas
        m = -C(i,j) / C(j,j);        % divide o elemento a ser zerado pelo pivo
        C(i,:) = C(i,:) + m * C(j,:); % nova linha I eh a velha I + modificador * pivo
    end 
end


% etapa 2 - retrossubstituicao
x = zeros(n,1); % vetor solucao
for i=n:-1:1 % for (i = n; i > -1; i--;)
    x(i) = ( C(i,n+1) - C(i,1:n) * x) / C(i,i) ;
end


end