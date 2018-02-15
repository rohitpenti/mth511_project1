
alpha=100.7;
lamda=1;
ai=floor(alpha);
af=alpha-ai;
c=2^(af)/(gamma(af+1))
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
	u=rand;
	a=-2*log(1-u^(1/af));
	u2=rand;
	if u2<(a^(af-1)*e^(-a/2))*((2*(1-e^(-a/2)))^(1-af))
		Z=[Z a];
		acc=acc+1;
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
hist(X,60,1)
%% 11.7,60,8.7 for alpha=3.2,100.7,1.5
hold off
		
time_taken=toc
