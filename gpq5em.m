%parameters for euler maryama program 
T = 1; N = 100; dt = T/N;

%discretizing Brownian motion stuff - got from AAITNSOSDE
dW = sqrt(dt)*randn(1,N); 
W = cumsum(dW); 
L = N; Dt = R*dt;
c = 9;

tlist = linspace(0,500,L);
xlist = zeros(1,L);

x0 = -0.0005;
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
plot(tlist,xlist)
  
