function p =ball_projection(x,r)
if norm(x)<r
    p=x;
else
    p=r*x/norm(x);
end
end
