% ThemaDyo.m

% x variable
syms x;

% orismos f1(x) f2(x) f3(x)
f_1=(x-2)^2 + x*log(x+3);
f_2 = 5^x + (2-cos(x))^2;
f_3 = exp(x) * (x^3-1) + (x-1)*sin(x);

figure('Name','Μέθοδος Χρυσού Τομέα','NumberTitle','on')

counter=[];
l=[];

%gia tin f1(x) 
i=0;
for lambda = linspace(0.0021,0.1,50)
    i= i + 1;
    [a,b,k,l(i),counter(i)] = xrusostomeas(f_1,lambda);
end

subplot(3,1,1)
plot(l,counter)
ylabel('f1')
xlabel('lambda')

%gia tin f2(x)
i=0;
for lambda = linspace(0.0021,0.1,50)
    i= i + 1;
    [a,b,k,l(i),counter(i)] = xrusostomeas(f_2,lambda);
end

subplot(3,1,2)
plot(l,counter)
ylabel('f2')
xlabel('lambda')

% gia tin f3(x)
for lambda = linspace(0.0021,0.1,50)
    i= i + 1;
    [a,b,k,l(i),counter(i)] = xrusostomeas(f_3,lambda);
end

subplot(3,1,3)
plot(l,counter)
ylabel('f3')
xlabel('lambda')


% grafikes parastaseis akrwn [ak,bk]
% lambda:metavlito
lambda=[0.003 0.015 0.2];

figure('Name','Plots for edges','NumberTitle','on')

%f1(x)
for i=1:3
    subplot(3,3,i)
    [a,b,k,l,counter] = xrusostomeas(f_1,lambda(i));
   
    for j=0:1:k
        plot(j,a(j+1),'*r')
        hold on
        plot(j,b(j+1),'og')
    end
    title(sprintf('f1 | l=%.3f',lambda(i)))
end



%f2(x)
for i=1:3
    subplot(3,3,i+3)
    [a,b,k,l,counter] = xrusostomeas(f_2,lambda(i));

    for j=0:1:k
        plot(j,a(j+1),'*r')
        hold on
        plot(j,b(j+1),'og')
    end  
    title(sprintf('f2 | l=%.3f',lambda(i)))
end


%f3(x)
for i=1:3
    subplot(3,3,i+6)
    [a,b,k,l,counter] = xrusostomeas(f_3,lambda(i));

    for j=0:1:k
        plot(j,a(j+1),'*r')
        hold on
        plot(j,b(j+1),'og')
    end  
    title(sprintf('f3 | l=%.3f',lambda(i)))
end