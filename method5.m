alpha=3.2;
lamda=1;
ai=floor(alpha);
af=alpha-ai;
d=1.0334-0.0766*e^(2.2942*af)
a=(2^af)*((1-e^(-d/2))^(af));
b=af*(d^(af-1))*(e^(-d));
c=(a+b)/gamma(af+1)
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
	if u<a/(a+b)
		g=-2*log(abs(1-0.5*((c*u*gamma(af+1))^(1/af))));
	else
		g=-log(abs((c*(1-u)*gamma(af+1))/(af*(d^(af-1)))));
	end
	u2=rand;
	if g<=d
		if u2<=((g^(af-1))*(e^(-g/2)))/((2^(af-1))*((1-e^(-g/2))^(af-1)));
		Z=[Z g];
		acc=acc+1;
		end
	else
		if u2<=(g/d)^(af-1)
		Z=[Z g];
		acc=acc+1;
		end
	end

	tot=tot+1;
endwhile 
X=Y+Z/lamda;
disp('Rejection Ratio is:'), disp(1-acc/tot);

x1 = 0.005:0.01:12;
%%0.005-12,60-140,0.005-10 for alpha = 3.2,100.7,1.5
y1 = gampdf(x1,alpha,lamda);


plot(x1,y1,'r-')
hold on
hist(X,11.7,1)
%% 11.7,60,8.7 for alpha=3.2,100.7,1.5
hold off
		
time_taken=toc
