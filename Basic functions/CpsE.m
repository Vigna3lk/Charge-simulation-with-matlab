function [SumE,SumRx,SumRy] = CpsE(Ea,rExa,rEya,qa,Eb,rExb,rEyb,qb,Ec,rExc,rEyc,qc,Ed,rExd,rEyd,qd)
%     SumRx=rExa+rExb;
%     SumRy=rEya+rEyb;
%    SumE=sqrt((sign(qa)*Ea*rExa+sign(qb)*Eb*rExb).^2+(sign(qa)*Ea*rEya+sign(qb)*Eb*rEyb).^2);
    if nargin/4==2
        SumRx=Ea.*rExa+Eb.*rExb;
        SumRy=Ea.*rEya+Eb.*rEyb;
        SumE=sqrt(SumRx.^2+SumRy.^2);
        SumRx=SumRx./SumE;
        SumRy=SumRy./SumE;
    elseif nargin/4==3
        SumRx=Ea.*rExa+Eb.*rExb+Ec.*rExc;
        SumRy=Ea.*rEya+Eb.*rEyb+Ec.*rEyc;
        SumE=sqrt(SumRx.^2+SumRy.^2);
        SumRx=SumRx./SumE;
        SumRy=SumRy./SumE;
    elseif nargin/4==4
        SumRx=Ea.*rExa+Eb.*rExb+Ec.*rExc+Ed.*rExd;
        SumRy=Ea.*rEya+Eb.*rEyb+Ec.*rEyc+Ed.*rEyd;
        SumE=sqrt(SumRx.^2+SumRy.^2);
        SumRx=SumRx./SumE;
        SumRy=SumRy./SumE;
    end
end