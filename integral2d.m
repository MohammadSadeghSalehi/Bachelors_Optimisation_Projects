function min=integral2d(f,a,b,c,d,n,epsilon)
%%%%making the integral function f-(f(c)+1)
T=f(a,c)+1;
g=@(x,y) abs(20+x.^2-10*cos(2*pi*x)+y.^2-10*cos(2*pi*y)-T);
int_matrix=zeros(n);
while((b-a)*(d-c)/n>epsilon)
    t1=(b-a)/n;
    t2=(d-c)/n;
    %calculate integral matrix
    for i=1:n
        for j=1:n
            if f(a+(i)*t1,c+(j)*t2)>T
                int_matrix(i,j)=-inf;
            else
            int_matrix(i,j)=integral2(g,a+(i-1)*t1,a+(i)*t1,c+(j-1)*t2,c+(j)*t2);
            end
        end
    end
    
    max=int_matrix(1,1);
    index=[1 1];
    for i=1:n
        for j=1:n
           if(int_matrix(i,j)>max)
               max=int_matrix(i,j);
               index(1)=i;index(2)=j;
           end
        end
    end
    
    min=[(a+(index(1)-1)*t1 + a+(index(1))*t1)/2 (c+(index(2)-1)*t2 + c+(index(2))*t2)/2];
    a=a+(index(1)-1)*t1;
    b=a+(index(1))*t1;
    c=c+(index(2)-1)*t2;
    d=c+(index(2))*t2;
    %disp(min);
end

end