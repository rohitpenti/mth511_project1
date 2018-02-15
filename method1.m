
alpha=100.7;
lamda=1;
ai=floor(alpha);
af=alpha-ai;
k=(af*gamma(af)*e)/(e+af);
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
t1=toc

while (size(Z)(2)<1000)
	u1=rand;
	if u1<e/(e+af)
		a=(u1*(1+af/e))^(1/af);
	else
		a= -1*(log((1-u1)*(af+e)/(af*e)));
	end
	u2=rand;
	if a<1
		if u2<e^(-lamda*a)
			Z=[Z a];
			acc=acc+1;
		end
	else 
		if u2<a^(af-1)
			Z=[Z a];
			acc=acc+1;
		end
	end
	tot=tot+1;
endwhile 
X=Y+Z/lamda;
disp('Rejection Ratio is:'), disp(1-acc/tot);

x1 = 60:0.01:140;
%%0.005-12,60-140,0.005-10 for alpha = 3.2,100.7,1.5
y1 = gampdf(x1,alpha,lamda);


plot(x1,y1,'r-')
hold on
hist(X,65,1)
%% 11.7,50,8.7 for alpha=3.2,100.7,1.5
hold off
		
t=toc
