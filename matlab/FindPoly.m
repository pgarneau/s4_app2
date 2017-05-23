function [poly] = FindPoly(y_e)
x = [0 8 15 20 25];
Y = [30; 19; 20; 16; y_e];

P = [1 x(1) (x(1))^2 (x(1))^3 (x(1))^4;
     1 x(2) (x(2))^2 (x(2))^3 (x(2))^4;
     1 x(3) (x(3))^2 (x(3))^3 (x(3))^4;
     1 x(4) (x(4))^2 (x(4))^3 (x(4))^4;
     1 x(5) (x(5))^2 (x(5))^3 (x(5))^4];

A = inv(P)*Y;

syms x
poly = A(1) + A(2)*x + A(3)*x.^2 + A(4)*x.^3 + A(5)*x.^4;
end

