alpha=100.7;
lamda=1;

Z=[];
tic
for i=1:1000
	Z=[Z gaminv(rand,alpha,1/lamda)];
end
x1 = 60:0.01:140;
%%0.005-12,60-140,0.005-10 for alpha = 3.2,100.7,1.5
y1 = gampdf(x1,alpha,lamda);


plot(x1,y1,'r-')
hold on
hist(Z,60,1)
%% 11.7,60,8.7 for alpha=3.2,100.7,1.5
hold off
		
time_taken=toc
