function min=integral_method_edited(f,a,b,n,epsilon)
T=f(a)+1;
x=linspace(a,b,n);
%%%%fixing end point
for i=2:n
        if f(x(i))>T
            b=x(i-1);
            break;
        end
end
counter=0;
while((b-a)/n>epsilon)
    t=(b-a)/n;
    x=linspace(a,b,n);
    y=abs(T-f(x));
    temp=[0 0];
    integral=zeros(1,n-1);
    for i=1:n-1
        temp(1)=y(i);temp(2)=y(i+1);
        I=[a+(i-1)*t a+i*t];
        integral(i)=trapz(I,temp);
    end
    %%finding max surface
    max=integral(1);
    index=1;
    for i=2:n-1
        if (integral(i)>max)
            max=integral(i);
            index=i;
        end
    end
    %%%%%
    min=((a+(index-1)*t)+(a+index*t))/2;
    a=(a+(index-1)*t);
    b=(a+index*t);
        counter=counter+1;
end
disp(counter);