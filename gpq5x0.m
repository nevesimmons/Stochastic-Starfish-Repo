%parameters for euler maryama program 
T = 1; N = 100; dt = T/N;

%discretizing Brownian motion stuff - got from AAITNSOSDE
dW = sqrt(dt)*randn(1,N); 
W = cumsum(dW); 
L = N; Dt = R*dt;
c = 9;

tlist = linspace(0,500,L);
xlist = zeros(1,L);
xopts = linspace(-1,1,10);


figure;
hold on;
for i=1:10
    x0 = xopts(i);
    xj = x0;
    xlist(:,1) = xj;
    for j=1:L-1 
        Winc = sum(dW((j-1)+1:j));
        xj = xj + (xj-xj^3)*dt + c*Winc;
        disp(xj)
        %not entirely sure about W component 
        xlist(:,j+1) = xj;
    end
    plot(tlist,xlist, 'LineWidth',3)
end

