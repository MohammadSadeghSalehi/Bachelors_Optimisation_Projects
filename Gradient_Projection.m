function [x,fun_val]=Gradient_Projection(f,gr,x0,r,t,epsilon)
%projection is projection of unit ball and the step size is constant
grad=matlabFunction(gr);
gradient=grad(x0(1),x0(2));
iter=0;
x=ball_projection(x0-t*gradient,r);
func=matlabFunction(f);
while(norm(x-x0)>epsilon)
    gradient=grad(x(1),x(2));
    x0=x;
    iter=iter+1;
    x=ball_projection(x0-t*gradient,r);
    fun_val=func(x(1),x(2));
    fprintf('iter_number= %4d funval= %2.6f \n',iter,fun_val);
end
    