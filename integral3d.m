function min=integral3d(f,a1,b1,a2,b2,a3,b3,n,epsilon)
T=f(a1,a2,a3)+1;
g=@(x,y,z)abs(-exp(-0.5.*(x.^2+y.^2+z.^2))-T);
int_matrix(:,:,1)=zeros(n);
while((b1-a1)*(b2-a2)*(b3-a3)/n>epsilon)
    t1=(b1-a1)/n;
    t2=(b2-a2)/n;
    t3=(b3-a3)/n;
    %calculate integral matrix
    for k=1:n
        
            int_matrix(:,:,k)=zeros(n);
        
    end
    for i=1:n
        for j=1:n
            for k=1:n
                if f(a1+(i)*t1,a2+(j)*t2,a3+(k)*t3)>T
                    
                    int_matrix(i,j,k)=-inf;
                else
                int_matrix(i,j,k)=integral3(g,a1+(i-1)*t1,a1+(i)*t1,a2+(j-1)*t2,a2+(j)*t2,a3+(k-1)*t3,a3+(k)*t3);
                
                end
            end
        end
    end
    
    max=int_matrix(1,1,1);
    index=[1 1 1];
    for i=1:n
        for j=1:n
            for k=1:n
                
               if(int_matrix(i,j,k)>max)
                   max=int_matrix(i,j,k);
                   index(1)=i;index(2)=j;index(3)=k;
               end
               
            end
        end
    end
    
    min=[(a1+(index(1)-1)*t1 + a1+(index(1))*t1)/2 (a2+(index(2)-1)*t2 + a2+(index(2))*t2)/2 (a3+(index(3)-1)*t3 + a3+(index(3))*t3)/2];
    a1=a1+(index(1)-1)*t1;
    b1=a1+(index(1))*t1;
    a2=a2+(index(2)-1)*t2;
    b2=a2+(index(2))*t2;
    a3=a3+(index(3)-1)*t3;
    b3=a3+(index(3))*t3;
    %disp(min);
end

end