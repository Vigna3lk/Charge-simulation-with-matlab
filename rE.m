function [rx,ry] = rE(px,py,x,y,q)
    x = x(1, : );
    y = y(:,1);
    rx=zeros(length(x));
    ry=zeros(length(x));
    dist=sqrt((x-px).^2+(y-py).^2);
    rx= round(sign(q).*(x-px)./dist,10);
    ry= round(sign(q).*(y-py)./dist,10);
    [u,o]=find(dist==0);
    rx(u,o)=0;
    ry(u,o)=0;
end