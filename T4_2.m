clear;

[x,y]=meshgrid(-2:0.01:2,-2:0.01:2); 
d=0.2;
qa=-1;
xa=-d/2;ya=0;
qb=4;
xb=d/2;yb=0;

Uz=(U(xa,ya,x,y,qa)+U(xb,yb,x,y,qb));
Uz=Uz./50;
[rExa,rEya]=rE(xa,ya,x,y,qa);
[rExb,rEyb]=rE(xb,yb,x,y,qb);
E=CpsE(Elc(xa,ya,x,y,qa),rExa,rEya,qa,Elc(xb,yb,x,y,qb),rExb,rEyb,qb);
E=E./200;
subplot(3,1,1),mesh(x,y,Uz) 
hold on,
[~,h]=contour3(x,y,Uz,[0.4,0.4]); 
set(h,'Color','red')
axis([-2*d 2*d -2*d 2*d])
xlabel('x轴')
ylabel('y轴')
title('电位分布')

subplot(3,1,2),
[~,h]=contour3(x,y,Uz,[0.15,0.15]); 
hold on,mesh(x,y,E)
set(h,'Color','red')
axis([-2*d 2*d -2*d 2*d])
xlabel('x轴')
ylabel('y轴')
title('电场大小分布')

[x,y]=meshgrid(-2:0.1:2,-2:0.1:2); 
[rExa,rEya]=rE(xa,ya,x,y,qa);
[rExb,rEyb]=rE(xb,yb,x,y,qb);
[~,rEx,rEy]=CpsE(Elc(xa,ya,x,y,qa),rExa,rEya,qa,Elc(xb,yb,x,y,qb),rExb,rEyb,qb);
subplot(3,1,3),quiver(x,y,rEx,rEy)
hold on,plot(xa,ya,'.','MarkerSize', 16,"Color",'r')
hold on,plot(xb,yb,'.','MarkerSize', 16,"Color",'r')
axis([-0.7 0.7 -0.7 0.7])
text(xa+0.01,ya+0.1,'-1C','FontSize',12)
text(xb+0.01,yb+0.1,'+4C','FontSize',12)
xlabel('x轴')
ylabel('y轴')
title('电场方向分布')