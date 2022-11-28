function [y]=Eggholder(x)
%% min=-959,6407 for x=[512,404,2319]
x1=x(1);
x2=x(2);
dx1=length(x1);
dx2=length(x2);
y=zeros(dx1,dx2);
for i=1:dx1
    for j=1:dx2
        y(i,j)=-(x2(j)+47)*sin(sqrt(abs(x1(i)/2+x2(j)+47)))-x1(i)*sin(sqrt(abs(x1(i)-(x2(j)+47))));
    end
end
end
