%parameters for euler maryama programme 
dt = T/L;
N=100;

%to run through all initial conditions
init = linspace(-1,1,1000);


dW = sqrt(dt)*randn(1,N); 
W = cumsum(dW); 
mu = 1;

%wondering whether to include changes of c in x0 loop or create separate
%loop so could compare how c changes with diff values of x0  
for i=1:n
    x0 = init(i);
    xj = x0;
    xlist(:,1) = xj;

    for j=1:N 
        tau = j*dt;
        xj = xj + (xj-xj^3)*dt + c*([dt:dt:T])+mu*W);
        xlist(:,j) = xj;
    end
end    
