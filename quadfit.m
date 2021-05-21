%Exercise 3.2
randn('seed',314);
x=linspace(0,1,30);
y=2*x.^2-3*x+1+0.05*randn(size(x));
A=zeros(30,3);
b=zeros(30,1);
for i=1:30
    A(i,1)=x(i)^2;
    A(i,2)=x(i);
    A(i,3)=1;
    b(i)=y(i);
end
fit=A\b;
a=fit(1);
b=fit(2);
c=fit(3);
disp(fit);
f=@(x)a*x.^2+b*x+c;
hold on
plot(x,y,'*');
plot(x,f(x));
hold off
