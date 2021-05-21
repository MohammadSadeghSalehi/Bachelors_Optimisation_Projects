function [x,r]=circleFittingWithInput(A)
[m,n]=size(A);
b=zeros(m,1);
for i=1:m
    b(i,1)=A(i,1)^2+A(i,2)^2;
end
AT=transpose(A);
d=double(AT)*double(A);
y=double(double(inv(d))*double(AT))*double(b);
disp(y);
th=0:pi/50:2*pi;
xunit=y(3)*cos(th)+y(1);
yunit=y(3)*sin(th)+y(2);
plot(xunit,yunit);
x(1)=y(1);
x(2)=y(2);
r=y(3);
end