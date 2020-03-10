function v = ILagrangeFunction(x,y,u)
% esta funcao aplica o metodo de Lagrange para interpolar valores


% inicializacao
n = length(x); % tamanho de X
m = length(u); % quantos pontos precisam ser estimados
v = zeros(m, 1);

for k = 1:m % total de estimativas
    s = 0;
    
    % laco do somatorio
    for i=1:n 
        p = y(i);
        
        % laco do produtorio
        for j = 1:n 
            if j ~= i
                p = p * (u(k) - x(j)) / (x(i) - x(j));
            end
        end
        s = s + p; % acumula o produtorio recem calculado
            
    end
    
    v(k) = s;
end

end % end function