function [result] = FindOpeningPercentage(A_matrix, coeff, M)
matrix = zeros(1,M);

for x = 1:M
    if x == M
        matrix(1,x) = A_matrix(1) - coeff;
    else
        matrix(1,x) = A_matrix(M-x+1);
    end
end
result = roots(matrix);
end

