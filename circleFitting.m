%circle fitting with specific data
%constructing A~ with 30 points 
a=ones(3,30);
a(1,:)=linspace(0,1,30);
a(2,:)=2*a(1,:).^2-3*a(1,:)+0.05*randn(size(a(1,:)));
a(3,:)=-0.5;
A=zeros(30,3);
b=zeros(30,1);
for i=1:30
    A(i,:)= transpose(2*a(:,i));
end
for i=1:30
    b(i,1)=a(1,i)^2+a(2,i)^2;
end
AT=transpose(A);
%solve by MATLAB property \
fit=(AT*A)\(AT*b);
disp(fit);
%solve by explicit formula 
d=double(AT)*double(A);
y=double(double(inv(d))*double(AT))*double(b);
disp(y);
%calculate the radius
rr=sqrt(y(1)^2+y(2)^2-y(3));

r=sqrt(fit(1)^2+fit(2)^2-fit(3));
disp(rr);
disp(r);
%%%
th=0:pi/50:2*pi;
xunit=rr*cos(th)+y(1);
yunit=rr*sin(th)+y(2);
%%%%
hold on
plot(xunit,yunit);
plot(a(1,:),a(2,:),'*');
hold off

