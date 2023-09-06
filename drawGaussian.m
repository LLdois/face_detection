function p=drawGaussian(u,v,x,y)
% u向量;v,协方差矩阵
%x=150:0.5:190;   
%y=35:110;       
% [X,Y]=meshgrid(x,y);
% DX=v(1,1);     %X的方差
% dx=sqrt(DX);   %X的标准差
% DY=v(2,2);     %Y的方差
% dy=sqrt(DY);   %Y的标准差
% COV=v(1,2);     %X Y的协方差
% r=COV/(dx*dy);   
% part1=1/(2*pi*dx*dy*sqrt(1-r^2));
% p1=-1/(2*(1-r^2));
% px=(X-u(1)).^2./DX;
% py=(Y-u(2)).^2./DY;
% pxy=2*r.*(X-u(1)).*(Y-u(2))./(dx*dy);
% Z=part1*exp(p1*(px-pxy+py));    
% p=diag(Z);
% p=p./max(p);
[a,b] = size(x);
p =zeros(a*b,1);
% [X,Y]=meshgrid(x,y);
for i =  1:a*b
    X1 = [x(i),y(i)]';
    p(i) = exp(-0.5*(X1-u)'*v^-1*(X1-u));
end
p = p./max(p);