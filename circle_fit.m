%Exercise 3.3
function [x,r]=circle_fit(A)
[n,m]=size(A);
Ahat=zeros(m,n+1);
b=zeros(m,1);
for i=1:m
    for j=1:n
        Ahat(i,j)=2*A(j,i);
        b(i)=b(i)+A(j,i)^2;
    end
    Ahat(i,n+1)=-1;
end
AT=transpose(Ahat);
fit=(AT*Ahat)\(AT*b);
x=zeros(1,n);
for i=1:n
    x(i)=fit(i);
end
r=sqrt(norm(x)^2-fit(n+1));
if(n==2)
th=0:pi/50:2*pi;
xunit=r*cos(th)+fit(1);
yunit=r*sin(th)+fit(2);
hold on
plot(xunit,yunit);
xlim([fit(1)-(r+1) fit(1)+(r+1)])
ylim([fit(2)-(r+1) fit(2)+(r+1)])
plot(A(1,:),A(2,:),'*');
hold off
end
