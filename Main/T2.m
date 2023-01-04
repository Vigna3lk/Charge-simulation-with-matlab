clear;

[x,y]=meshgrid(-1:0.01:1,-1:0.01:1); 
a=0.1;
xa=a;ya=a;q=1;
x2=-xa;y2=ya;q2=-q;
x3=-xa;y3=-ya;q3=q;
x4=xa;y4=-ya;q4=-q;

Uz=U(xa,ya,x,y,q)+U(x2,y2,x,y,q2)+U(x3,y3,x,y,q3)+U(x4,y4,x,y,q4);
lx=length(x);ly=length(y);
subplot(3,1,1),meshc(x,y,Uz)
axis([0 0.5 0 0.5 0 35])
xlabel('x轴')
ylabel('y轴')
title('镜像法电位分布')

[x,y]=meshgrid(-1:0.01:1,-1:0.01:1); 
[rExa,rEya]=rE(xa,ya,x,y,q);
[rEx2,rEy2]=rE(x2,y2,x,y,q2);
[rEx3,rEy3]=rE(x3,y3,x,y,q3);
[rEx4,rEy4]=rE(x4,y4,x,y,q4);
[E,rEx,rEy]=CpsE(Elc(xa,ya,x,y,q),rExa,rEya,q,Elc(x2,y2,x,y,q2),rEx2,rEy2,q2);
subplot(3,1,2),mesh(x,y,E)
axis([0 0.5 0 0.5 0 150])
xlabel('x轴')
ylabel('y轴')
title('镜像法电场大小分布')

subplot(3,1,3),quiver(x,y,rEx,rEy)
hold on,plot(xa,ya,'.','MarkerSize', 16,"Color",'r')
hold on,plot([0,0],get(gca,'Ylim'),"Color",'k')
hold on,plot(get(gca,'Xlim'),[0,0],"Color",'k')
axis([0 0.2 0 0.2])
xlabel('极板a')
ylabel('极板b')
title('镜像法电场方向分布')
