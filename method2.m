
alpha=1.5;
lamda=1;
ai=floor(alpha);
af=alpha-ai;
d=0.07+(1-af)^.5
k=((d^af)/(af*gamma(af))+(d^(af-1))*(e^(-d))/(gamma(af)))^(-1);
X=[];
Y=[];
Z=[];
tic
for i=1:1000
y=[];
for i=1:ai
	y=[y -1*(log(1-rand))/lamda];
end
Y=[Y sum(y)];
end
tot=0;
acc=0;

%%t1=toc

while (size(Z)(2)<1000)
	u1=rand;
	if u1<k*(d^af)/(af*gamma(af))
		a=(u1*af*gamma(af)/k)^(1/af);
	else
		a= -1*(log(abs(e^(-d)+d/af-u1*gamma(af)/k)));
	end
	u2=rand;
	if a<d
		if u2<e^(-lamda*a)
			Z=[Z a];
			acc=acc+1;
		end
	else 
		if u2<(a/d)^(af-1)
			Z=[Z a];
			acc=acc+1;
		end
	end
	tot=tot+1;
endwhile 
X=Y+Z/lamda;
disp('Rejection Ratio is:'), disp(1-acc/tot);

x1 = 0.005:0.01:10;
%%0.005-12,60-140,0.005-10 for alpha = 3.2,100.7,1.5
y1 = gampdf(x1,alpha,lamda);


plot(x1,y1,'r-')
hold on
hist(X,8.7,1)
%% 11.7,50,10.7 for alpha=3.2,100.7,1.5
hold off
		
t=toc
