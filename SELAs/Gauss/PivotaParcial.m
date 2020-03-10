function C = PivotaParcial(C, n, j)
% Esta fun??o faz o pivotamento parcial
% Troca do piv?

p = abs(C(j,j));
k = j;      % ?ndice da linha do piv? atual

% Busca do piv?
for i = j+1 : n % da linha j+1 at? a linha n
    if abs(C(i,j)) > p
        p = abs(C(i,j));
        k = i;
    end
end
        
% Pivotamento imposs?vel - quando p = 0
if p == 0
    disp('--- PIVOTAMENTO IMPOSSIVEL ---')
end

% Permuta??o das linhas j (antigo piv?) e k (novo piv?)
if k > j
    T = C(j,:);
    C(j,:) = C(k,:);
    C(k,:) = T;
end
    
end % end function
