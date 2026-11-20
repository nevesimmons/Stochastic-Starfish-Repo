%parameters for euler maryama program 
T = 50; N = 1000; dt = T/N;

%discretizing Brownian motion stuff - got from AAITNSOSDE
dW = sqrt(dt)*randn(1,N); 
W = cumsum(dW); 
L = N; 
Dt = R*dt;
c = 0.01;

tlist = linspace(0,50,L);
xlist = zeros(1,L);

x0 = 0.5;
xj = x0;
xlist(:,1) = xj;
for j=1:L-1 
    Winc = sum(dW((j-1)+1:j));
    xj = xj + (xj-xj^3)*dt + c*Winc;
    disp(xj)
    %not entirely sure about W component 
    xlist(:,j+1) = xj;
end

close all
plot(tlist,xlist,'LineWidth',1.5)
hold on;
xlabel('time');
ylabel('x(t)');
title('Euler Maryama method to show relationship between time and X(t)');
set(gca,'FontSize',15);


