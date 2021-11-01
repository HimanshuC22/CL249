% Function to calculate derivative values
function [Y1_dash, Y2_dash, Y3_dash] = derivative(y1, y2, c, d)
    Y1_dash = -c*y1*y2;
    Y2_dash = (c*y1*y2) - (d*y2);
    Y3_dash = d*y2;
    return
end