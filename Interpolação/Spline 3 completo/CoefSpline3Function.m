function C = CoefSpline3Function(x,y)

%X e Y precisam estar ordenados
aux = sort(x);
x = aux;
% 
% aux = sort(y);
% y = aux;

% esta funcao calcula os coeficientes do spline cubico
% C[0] = primeiro spline
% C[1] = segundo spline
% C[3] = terceiro spline

% determinacao de h e p
n = length(x); % numero de pontos
h = zeros(n-1, 1); % os h dependem das coordenadas X dos pontos
p = zeros(n-1, 1); % os p dependem das coordenadas Y dos pontos

for k=1:n-1
    h(k) = x(k+1) - x(k);
    p(k) = (y(k+1) - y(k))/h(k);

end


% determinacao de H, P e m
H = zeros(n);
P = zeros(n,1);

H(1,1) = 1;
P(1) = 0;
for k=2:n-1
   H(k, k-1)    = h(k-1);
   H(k,k)       = 2*(h(k-1) + h(k));
   H(k, k+1)    = h(k);
   P(k)         = 6*(p(k) - p(k-1));
end

H(n,n) = 1;
P(n) = 0;

m = SLGaussFunction(H,P);


C = zeros(n-1, 4);
for k=1:n-1
    C(k,1)=(m(k+1)-m(k))/(6*h(k));
    C(k,2)=m(k)/2;
    C(k,3)=p(k)-((2*m(k)+m(k+1))*h(k))/6;
    C(k,4)=y(k);

end % fim function