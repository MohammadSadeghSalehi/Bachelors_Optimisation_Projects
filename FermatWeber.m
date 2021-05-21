function[xkn] = FermatWeber(eps,m)
    %Course exercise
    %input anchor points & weights
    anchorMatrix = input('Enter the anchor points: ')
    weightMatrix = input('Enter the weights: ')
    
    %calculate primary things
    %buliding f
    f = @(x,i)weightMatrix(i)*norm(x-anchorMatrix(i,:))
    fai = [];
    for i=1:m
        fai = [fai,f(anchorMatrix,i)]
    end
    fmin = fai(1,1);
    sumfai = fai(1,1);
    for i=2:m
        fmin = min(fmin,fai(i));
        sumfai = sumfai + fai(i);
    end
    fmin
    
    %Choosing xZero
    xZero = anchorMatrix(1,:)/m;
    for i=2:m
        xZero = xZero + [(anchorMatrix(i,:))/m];
    end
    
    for i=1:m
        if(xZero==anchorMatrix(i,:))
            xZero = xZero+eps;
        end
    end    
    
    xk = xZero
    tooleGam = 0;
    for i=1:m
        tooleGam = tooleGam + weightMatrix(i)/norm(xk-anchorMatrix(i,:));
    end
    tooleGam = 1/tooleGam ;
    
    xkn = 0;
    for i=1:m
        xkn = xkn + tooleGam*(weightMatrix(i)/norm(xk-anchorMatrix(i,:)))*(anchorMatrix(i,:))
    end
    
    while(norm(xkn-xk)>= eps)
        xk=xkn;
        tooleGam = 0;
        for i=1:m
            tooleGam = tooleGam + weightMatrix(i)/norm(xk-anchorMatrix(i,:))
        end
        tooleGam = 1/tooleGam ;
    
        xkn = 0;
        for i=1:m
            xkn = xkn + tooleGam*(weightMatrix(i)/norm(xk-anchorMatrix(i,:)))*(anchorMatrix(i,:))
        end
    end
    
end
