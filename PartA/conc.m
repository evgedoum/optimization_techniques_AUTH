% conc.m

syms x;

size = 10;
k1 = [];
k2 = [];
k3 = [];
k4 = [];

l1 = [];
l2 = [];
l3 = [];
l4 = [];

l = [];
epsilon = 0.0001; 

%sugkrisi apotelesmatwn xrisimopoiontas mono thn sunartisi f1
%f_1 = (x-3)^2 + (sin(x+3))^2;
%f_2 = 5^x + (2-cos(x))^2;
f_3 = exp(x) * (x^3-1) + (x-1)*sin(x);
figure(1)

i = 0;
for lambda=linspace(0.0021,0.01,size)
    i = i + 1;
 
[~,~,k1(i),~,l1(i)] = dixotomos(f_1,epsilon,lambda);

[~,~,~,l2(i),k2(i)] = xrusostomeas(f_1,lambda);

[~,~,~,l3(i),~,~,k3(i)] = fibonacciM(f_1,lambda,epsilon);

[~,~,~,l4(i),k4(i)] = dixotomospar(f_1,lambda);

end

%kokkino gia dixotomo
plot(l1,2*k1,'r')
hold on
%mple gia xruso tomea
plot(l2,k2,'b')
hold on 
%magenta gia fibonacci
plot(l3,k3,'m')
hold on
%prasino gia dixotomo me paragwgous
plot(l4,k4,'g')

ylim([9 28])
title('sugkrisi metaksi twn 4 methodwn gia f3')
xlabel('l')
ylabel('arithmos klisewn sinartisis')
legend('dixotomos','xrusos tomeas','fibonacci','dixotomos me paragwgous')