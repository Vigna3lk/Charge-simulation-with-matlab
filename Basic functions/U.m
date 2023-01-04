function [u] = U(px,py,x,y,q)
    u = q ./sqrt((x-px).^2+(y-py).^2+0.001) ;
end