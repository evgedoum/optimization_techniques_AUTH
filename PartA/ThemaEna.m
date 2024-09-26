%ThemaEna.m

% x variable
syms x;

% orismos f1(x) f2(x) f3(x)
f_1=(x-2)^2 + x*log(x+3);
f_2 = 5^x + (2-cos(x))^2;
f_3 = exp(x) * (x^3-1) + (x-1)*sin(x);
 
% lambda:stathero & epsilon:metavlito
figure('Name','Plots for fixed lambda','NumberTitle','on')

% statheri timi tou l
lambda=0.01;

k=[];
e=[];

% gia tin f1(x) me l=0.01
i=0;
for epsilon = linspace(0.001,0.0049,50)
    i= i + 1;
    [a,b,k(i),e(i),l] = dixotomos(f_1,epsilon,lambda);
end

subplot(3,1,1)
plot(e,2*k)
ylabel('f1')
xlabel('e')

% gia tin f2(x) me l=0.01
i=0;
for epsilon = linspace(0.001,0.0049,50)
    i= i + 1;
    [a,b,k(i),e(i),l] = dixotomos(f_2,epsilon,lambda);
end

subplot(3,1,2)
plot(e,2*k)
ylabel('f2')
xlabel('e')

% gia tin f3(x) me l=0.01
i=0;
for epsilon = linspace(0.001,0.0049,50)
    i= i + 1;
    [a,b,k(i),e(i),l] = dixotomos(f_3,epsilon,lambda);
end

subplot(3,1,3)
plot(e,2*k)
ylabel('f3')
xlabel('e')

% epsilon:stathero kai lambda:metavlito
figure('Name','Plots for fixed epsilon','NumberTitle','on')

% statheri timi tou e
epsilon=0.001;

k=[];
l=[];

% gia tin f1(x) me e=0.001
i=0;
for lambda = linspace(0.0021,0.1,50)
    i= i + 1;
    [a,b,k(i),e,l(i)] = dixotomos(f_1,epsilon,lambda);
end

subplot(3,1,1)
plot(l,2*k)
ylabel('f1')
xlabel('lambda')

% gia tin f2(x) me e=0.001
i=0;
for lambda = linspace(0.0021,0.1,50)
    i= i + 1;
    [a,b,k(i),e,l(i)] = dixotomos(f_2,epsilon,lambda);
end

subplot(3,1,2)
plot(l,2*k)
ylabel('f2')
xlabel('lambda')

% gia tin f3(x) me e=0.001
i=0;
for lambda = linspace(0.0021,0.1,50)
    i= i + 1;
    [a,b,k(i),e,l(i)] = dixotomos(f_3,epsilon,lambda);
end

subplot(3,1,3)
plot(l,2*k)
ylabel('f3')
xlabel('lambda')


% grafikes parastaseis akrwn [ak,bk]
% epsilon:sthatero
epsilon=0.001;

% lambda:metavlito
lambda=[0.003 0.015 0.2];

figure('Name','Plots for edges','NumberTitle','on')

% f1(x)
for i=1:3
    subplot(3,3,i)
    [a,b,k,e,l] = dixotomos(f_1,epsilon,lambda(i));
    for j=0:1:k
        plot(j,a(j+1),'*r')
        hold on
        plot(j,b(j+1),'og')
    end
title(sprintf('f1 | l=%.3f',lambda(i)))
end


% f2(x)
for i=1:3
    subplot(3,3,i+3)
    [a,b,k,e,l] = dixotomos(f_2,epsilon,lambda(i));
    for j=0:1:k
        plot(j,a(j+1),'*r')
        hold on
        plot(j,b(j+1),'og')
    end   
title(sprintf('f2 | l=%.3f',lambda(i)))
end


% f3(x)
for i=1:3
    subplot(3,3,i+6)
    [a,b,k,e,l] = dixotomos(f_3,epsilon,lambda(i));
    for j=0:1:k
        plot(j,a(j+1),'*r')
        hold on
        plot(j,b(j+1),'og')
    end  
title(sprintf('f3 | l=%.3f',lambda(i)))
end
