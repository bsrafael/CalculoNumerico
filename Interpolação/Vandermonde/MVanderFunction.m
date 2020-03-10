function X = MVanderFunction(x, m)

n = length(x);

X = zeros(n, m+1);

for i=1:n
    X(i, m+1) = 1;
    for j=m:-1:1  
        X(i,j) = x(i) * X(i, j+1);
    end

end