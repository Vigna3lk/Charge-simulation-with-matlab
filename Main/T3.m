clear;clc;

syms q e x y%电荷分布、介电常数
k=-q/(4*e);
Vx=k*x^2;
Vy=k*y^2;
eq=-q/e;

if diff(Vx,2)+diff(Vy,2)==eq
    format short
    fprintf("由于dVx/dx+dVy/dy=-q/e\n证明了该处的拉普拉斯方程\n");
    r=0.1;
    fprintf("下面，假设q分布为圆心处于(0,0),r=%g的圆,则在r<%g时符合泊松方程,在r>=%g时符合拉普拉斯方程\n",r,r,r);
    x=-2:0.1:2;y=-2:0.1:2;
    e=1;q=-1;
    k=-q/(4*e);
    Vx=k*x.^2;
    Vy=k*y.^2;
    V=zeros(length(x));
    for i=1:length(x)
        for j=1:length(y)
            dist=sqrt(x(i)^2+y(j)^2);
            if dist<r
                V(i,j)=10^4*(Vx(i)+Vy(j));
            else
                V(i,j)=-q/(dist);
            end
        end
    end
    
    [x,y]=meshgrid(-2:0.1:2,-2:0.1:2); 
    surf(x,y,V);
    shading interp
    xlabel('x轴')
    ylabel('y轴')
    zlabel('电位大小')
    title("电位分布")
    [u,v,k]=sphere(40);
    figure
    hold on,surf(u,v,k)
else
    fprintf("未能证明该处的拉普拉斯方程\n");
end