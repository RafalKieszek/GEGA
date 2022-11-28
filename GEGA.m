clc
clear all
numb=10;    % number of iteration
gen=2;      % number of generation before changing area of solution
pop=10;     % population size
delta=0.20; % size of temporary area of solution (% of solution area)
kill=3;     % number of iteration between Great Extinctions
num_kill=3; % number of do not killed solutions in population,
            %(num_kill best and num_kill worst survive)
 
lb_min=[0,0];       %lower boundary of area of solution
ub_max=[512,512];   %upper boundary of area of solution
f=@Eggholder;       %Eggholder function
 
xxx=rand(pop,2)*2*ub_max(1)-ub_max(1); %random generation of initial population
xx=xxx;     %save initial population due to comprise
x=xxx(1,:); %initial center of temporary area of solution
% points to plot
xxxx=zeros(10,2); yy=zeros(1); sc=zeros(10,1);
 
for kk=1:numb
    options = optimoptions('ga','MaxGenerations',gen,'PopulationSize',pop,...
'InitialPopulationMatrix',xx,'display','none','FunctionTolerance'...
,0.1);%options of grate extinction algorithm
    %modification of temporary area of solution
    if mod(kk,kill)==1 && kk~=kill %if great extinction, then
        lb=lb_min;
        ub=ub_max;
    else   %modyfi temporary area of solution as below
        lb=[x(1)-(ub_max(1)-lb_min(1))*delta,x(2)-(ub_max(2)-lb_min(2))*delta];
        ub=[x(1)+(ub_max(1)-lb_min(1))*delta,x(2)+(ub_max(2)-lb_min(2))*delta];
        for i=1:2 %if temporary area of solution exceeds area of solution, cutting
            if lb(i)<lb_min(i)
                lb(i)=lb_min(i);
                end
            if ub(i)>ub_max(i)
                ub(i)=ub_max(i);
            end
        end
end

    [x,y,~,~,pop_out,scores]=ga(f,2,[],[],[],[],lb, ...
ub,[],[],options); %genetic algorithm
    xxxx=[xxxx,pop_out]; yy=[yy,y]; sc=[sc,scores]; % points to plot

    % sort population
    pop_out=[pop_out,scores]; 
    pop_out=sortrows(pop_out,3);
    pop_out(:,3)=[];
    pop_out(num_kill+1:pop-num_kill,:)=[];%killing individuals in the population
    xx=pop_out;
    clear options
end
xxxx(:,1:2)=[]; yy(1)=[]; sc(:,1)=[];
[x_,ff]=fmincon(f,x,[],[],[],[],lb_min,ub_max);%minimalization of function by interior-point method
s=mean(sc(:,:));
plot(2:2:20,yy,'kv',2:2:20,s,'ro',21,ff,'b*')
ylabel('Fitness value'); xlabel('Generation')
lgd=legend('Best fitness', ...
'Mean fitness','After gradient method optimization');
lgd.FontSize = 8; xticks(0:2:20); xlim([0,22]);  ylim([-1000,0])
title(['Best: ',num2str(ff),', Mean: ',num2str(s(10))])

ilosc=10;
options = optimoptions('ga','MaxGenerations',gen*ilosc,'PopulationSize',pop,'InitialPopulationMatrix',xxx,'display','none',...
'FunctionTolerance',0.1,'PlotFcn', @gaplotbestf2);
[x_wz,fval_wz]=ga(f,2,[],[],[],[],lb_min,ub_max,[],[],options);
ylim([-1000,0]); xlim([0,22]);
