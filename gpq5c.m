%parameters for euler maryama program 
T = 50; N = 100000; dt = T/N;

%discretizing Brownian motion stuff - got from AAITNSOSDE
dW = sqrt(dt)*randn(1,N); 
W = cumsum(dW); 
L = N; 
Dt = R*dt;
x0 = 0.01;
xj = x0;

tlist = linspace(0,50,L);
xlist = zeros(1,L);
copts = linspace(0,2,5);

xlist(:,1) = xj;


figure;
hold on;
for i=1:length(copts)
    c = copts(i);
    for j=1:L-1 
        Winc = sum(dW((j-1)+1:j));
        xj = xj + (xj-xj^3)*dt + c*Winc;
        disp(xj)
        %not entirely sure about W component 
        xlist(:,j+1) = xj;
    end
    plot(tlist,xlist, 'LineWidth',1)
end

xlabel('time');
ylabel('x(t)');
title('EM method showing relationship between X(t) and t for changing c');
legend(compose('c = %.2f', copts), 'Location', 'best');
set(gca,'FontSize',15);

