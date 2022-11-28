function [y]=rastringis(x)
%% min=0 for x=[delta,delta]([10,10])
ddx=10;
x1=x(1);
x2=x(2);
dx1=length(x1);
dx2=length(x2);
y=zeros(length(x1),length(x2));
for i=1:dx1
    for j=1:dx2
        y(i,j)=(20+(x1(i)-ddx).^2+(x2(j)-ddx).^2)-10*(cos(2*pi*(x1(i)-ddx))+cos(2*pi*(x2(j)-ddx)));
    end
end
end
