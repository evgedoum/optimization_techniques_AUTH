% ΘΕΜΑ 1

% Δήλωση μεταβλητών, όπου x=x1 και y=x2.
syms x y;

% Τιμές για το ε και το γκ.
e = 0.001;
gk = [0.1 0.3 3 5];

% Τυχαίο σημείο εκκίνησης (x0,y0).
x0 = 1;
y0 = 3;

% Συνάρτηση προς μελέτη.
f = (1/3)*x^2 + 3*y^2;

% Γραφική παράσταση για σταθερό γκ=0.1.
subplot(2,2,1)
[X,k] = megistikathodos(f,e,x0,y0,gk(1));

Xx1 = X(1,:);
Xy1 = X(2,:);

sub1 = double(subs(f,{x,y},{Xx1(1,:),Xy1(1,:)}));
k = k + 1;

plot(1:k,sub1)
xlabel('k');
ylabel('f(x1,x2)');
title('γκ=0.1');

% Γραφική παράσταση για σταθερό γκ=0.3.
subplot(2,2,2)
[X,k] = megistikathodos(f,e,x0,y0,gk(2));

Xx2 = X(1,:);
Xy2 = X(2,:);

sub2 = double(subs(f,{x,y},{Xx2(1,:),Xy2(1,:)}));
k = k + 1;

plot(1:k,sub2)
xlabel('k');
ylabel('f(x1,x2)');
title('γκ=0.3');

% Γραφική παράσταση για σταθερό γκ=3.
subplot(2,2,3)
[X,k] = megistikathodos(f,e,x0,y0,gk(3));

Xx2 = X(1,:);
Xy2 = X(2,:);

sub2 = double(subs(f,{x,y},{Xx2(1,:),Xy2(1,:)}));
k = k + 1;

plot(1:k,sub2)
xlabel('k');
ylabel('f(x1,x2)');
title('γκ=3');

% Γραφική παράσταση για σταθερό γκ=5.
subplot(2,2,4)
[X,k] = megistikathodos(f,e,x0,y0,gk(4));

Xx2 = X(1,:);
Xy2 = X(2,:);

sub2 = double(subs(f,{x,y},{Xx2(1,:),Xy2(1,:)}));
k = k + 1;

plot(1:k,sub2)
xlabel('k');
ylabel('f(x1,x2)');
title('γκ=5');

% Νέα απεικόνιση για plot(x1,x2).
figure
subplot(2,1,1)
[X,k] = megistikathodos(f,e,x0,y0,gk(1));

Xx1 = X(1,:);
Xy1 = X(2,:);

sub1 = double(subs(f,{x,y},{Xx1(1,:),Xy1(1,:)}));
k = k + 1;

plot(Xx1,Xy1,'-x')
hold on;
fcontour(f,[-10 5 -8 12]);
xlabel('x1');
ylabel('x2');
title('γκ=0.1');

subplot(2,1,2)
[X,k] = megistikathodos(f,e,x0,y0,gk(1));

Xx2 = X(1,:);
Xy2 = X(2,:);

sub1 = double(subs(f,{x,y},{Xx2(1,:),Xy2(1,:)}));
k = k + 1;

plot(Xx2,Xy2,'-x')
hold on;
fcontour(f,[-10 5 -8 12]);
xlabel('x1');
ylabel('x2');
title('γκ=0.3');

