function [height] = FindHeight()
increment = 10:0.01:15;
counter = 0;
total = 0;
for y_e = increment
    poly = FindPoly(y_e);
    val = Derive(poly, 25);

    if (val >= -0.01) && (val <= 0.01)
        counter = counter + 1;
        total = total + y_e;
    end
end
height = total / counter;
end

