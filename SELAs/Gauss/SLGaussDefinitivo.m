% M?todo de Gauss para solu??o de sistemas de equa??es lineares
% "Gauss Definitivo"
% verifica poss?veis divis?es por zero que ocorrem quando o elemento
% piv? n?o est? na diagonal principal; uma estrat?gia consiste em permutar
% as linhas da matriz de modo que o elemento piv? seja um valor (absoluto)
% maior ou igual aos elementos abaixo de si em sua coluna.

close all;
clear all;
clc;

% Entrada - matriz coeficientes e vetor termos independentes
A = [1 2 4; 2 0 2; 4 1 3];

b = [30 20 40]';


n = size(A,1);
C = [A b];


% etapa 1 - escalonamento
%   transformar em estrutura triangular superior
%   varre-se as colunas at? n-1 pois n?o ? necess?rio ir at? a coluna n
%   zera-se abaixo do piv? at? o final
for j = 1:n-1   % colunas
    C = PivotaParcial(C, n, j);
    for i = j+1:n % linhas
        m = -C(i,j) / C(j,j);        % divide o elemento a ser zerado pelo piv?
        C(i,:) = C(i,:) + m * C(j,:); % nova linha I ? a velha I + modificador * piv?
    end 
end


% etapa 2 - retrossubstitui??o
x = zeros(n,1); % vetor solu??o
for i=n:-1:1 % for (i = n; i > -1; i--;)
    x(i) = ( C(i,n+1) - C(i,1:n) * x) / C(i,i) ;
end
x
        