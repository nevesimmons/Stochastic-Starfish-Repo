%creating the function
p = @(x) (x.^3 + 18)/13;

%this loop creates a list of each output x value at each iteration for
%function p
a0 = 1;
n = a0;
lstn = 0;

for i = 1:200
    lstn(end+1) = i;
    n(end+1) = p(a0);
    if abs(p(a0))>1e6
        % fprintf('Iteration failed at step %d\n', i);
        break;
    end
    if abs(p(a0) - a0) < 1e-6
        a0 = p(a0);
        break;
    end
    a0 = p(a0);
end

%this is another rearrangement of the function
g = @(x) (13*x - 18)./x.^2;

%this loop creates a list of each output x value at each iteration for
%function g

z0 = 1;
k = z0;
lstk = 0;

for i = 1:200
    lstk(end+1) = i;
    k(end+1) = g(z0);
    if abs(g(z0))>1e6
        z0 = g(z0);
        fprintf('Iteration failed at step %d\n', i);
        break;
    end
    if abs(g(z0) - z0) < 1e-6
        z0 = g(z0);
        break;
    end
    z0 = g(z0);
end


%this is another rearrangement of the function
f = @(x) nthroot(13*x - 18, 3);
x0 = 1;

%this loop creates a list of each output x value at each iteration for
%function f

lstj = 0;
j = x0;

for i = 1:200
    lstj(end+1) = i;
    j(end+1) = f(x0);
    if abs(f(x0))>1e6
        % fprintf('Iteration failed at step %d\n', i);
        break;
    end
    if abs(f(x0) - x0) < 1e-6
        x0 = f(x0);
        break;
    end
    x0 = f(x0);
end

%this is another rearrangement of the function
h = @(x) (x.^3 -13*x +18);

%this loop creates a list of each output x value at each iteration for
%function h

y0 = 1;
lstl = 0;
l = y0;

for i = 1:200
    lstl(end+1) = i;
    l(end+1) = h(y0);
    if abs(h(y0))>1e6
        % fprintf('Iteration failed at step %d\n', i);
        break;
    end
    if abs(h(y0) - y0) < 1e-6
        y0 = h(y0);
        break;
    end

    y0 = h(y0);
end

%this set of code if for plotting the graph including the different fixed
%point iterations for each rearrangement and a key for describing each 

plot(lstn,n,':','LineWidth', 2)
xlim([0 30])
ylim([-20 10])
hold on
plot(lstk,k,':','LineWidth', 2)
plot(lstj,j,':','LineWidth', 2)
plot(lstl,l,':','LineWidth', 2)
plot(lstm,m,':','LineWidth', 2)
hold off

legend('(i) (x^3+18)/13','(b) (13x-18)/x^2','(a) (13x-18)^{1/3}','(c) x^3-13x+18')
xlabel('Iteration number')
ylabel('x_k')
title('Fixed-point iteration comparison')
grid on
set(gca, 'FontSize', 15)