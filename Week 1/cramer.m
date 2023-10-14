A = input('Enter the coefficient matrix: ')
b = input('Enter the source vector: ')
N = length(b)
X = zeros(N,1)
d = det(A)
Aold = A;

if d ~= 0
    for i =1:N
        A(:,i) = b
        x(i) = det(A)/d
        A = Aold
    end
else 
    disp('Cramer rule not applicable')
end
