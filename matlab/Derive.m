function [d] = Derive(poly, x)

d = eval(subs(diff(poly), x));

end

