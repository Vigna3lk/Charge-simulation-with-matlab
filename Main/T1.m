clear;

[x,y]=meshgrid(-2:0.02:2,-2:0.02:2); 
d=0.2;
qa=1;qb=-1;
pax=-d/2;pay=0;pbx=d/2;pby=0;

Uz=U(pax,pay,x,y,qa)+U(pbx,pby,x,y,qb);
subplot(3,1,1),mesh(x,y,Uz) 
axis([-0.6 0.6 -0.6 0.6 -30 30])
xlabel('x轴')
ylabel('y轴')
title('电偶极子的电位分布')

[rExa,rEya]=rE(pax,pay,x,y,qa);
[rExb,rEyb]=rE(pbx,pby,x,y,qb);
[E,rEx,rEy]=CpsE(Elc(pax,pay,x,y,qa),rExa,rEya,qa,Elc(pbx,pby,x,y,qb),rExb,rEyb,qb);

subplot(3,1,2),mesh(x,y,E)
axis([-0.6 0.6 -0.6 0.6 0 150])
xlabel('x轴')
ylabel('y轴')
title('电偶极子的电场大小分布')
[x,y]=meshgrid(-2:0.1:2,-2:0.1:2); 
[rExa,rEya]=rE(pax,pay,x,y,qa);
[rExb,rEyb]=rE(pbx,pby,x,y,qb);
[E,rEx,rEy]=CpsE(Elc(pax,pay,x,y,qa),rExa,rEya,qa,Elc(pbx,pby,x,y,qb),rExb,rEyb,qb);
subplot(3,1,3),quiver(x,y,rEx,rEy)
hold on,plot(pax,pay,'.','MarkerSize', 16,"Color",'r')
hold on,plot(pbx,pby,'.','MarkerSize', 16,"Color",'r')
axis([-0.5 0.5 -0.5 0.5])
text(pax+0.01,pay+0.1,'+','FontSize',14)
text(pbx+0.01,pby+0.1,'-','FontSize',14)
xlabel('x轴')
ylabel('y轴')
title('电偶极子的电场方向分布')