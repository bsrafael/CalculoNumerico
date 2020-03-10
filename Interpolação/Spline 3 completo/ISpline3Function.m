function v = ISpline3Function(x, y, u)

% determinacao dos coeficientes

C = CoefSpline3Function(x,y);

% interpolacao
n = length(x);
r = length(u);
v = zeros(r,u);

for i=1:r
    
    % determinacao do intervalo que a estimativa precisa ser calculada,
    % para saber qual spline precisa ser utilizado
    % parte-se da estimativa que k eh 1
    k = 1; 
    
    
    % enquanto o valor da estimativa for maior que o limite superior e eu
    % nao cheguei no final dos intervalos, procuro o correto
    while (u(i) > x(k+1)) && (k<n-1)
       k = k+1;
    end
    
    % determinacao da ordenada
    t = u(i) - x(k);
    v(i) = ((C(k,1)*t+C(k,2))*t+C(k,3))*t+C(k,4);
end


% grafico
for k=1:n-1
    dom = x(k):0.1:x(k+1); % cria um dominio
    img = ( ( C(k,1) * (dom-x(k)) + C(k,2) ) .*  (dom-x(k)) + C(k,3) ) .* (dom-x(k)) + C(k,4);
    plot(dom,img,'k-', 'linewidth', 2)
    grid
end