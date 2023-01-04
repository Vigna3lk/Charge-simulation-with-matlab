function [e] = Elc(px,py,x,y,q)
    e = abs(q) ./((x-px).^2+(y-py).^2+0.01);
end