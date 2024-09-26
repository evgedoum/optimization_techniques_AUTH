% ΘΕΜΑ 4

% Δήλωση μεταβλητών.
syms x y;

% Τυχαίες τιμές για το ε και το γκ.
e = 0.01;
gk = 0.1;

% Συνάρτηση προς μελέτη.
f = (x^5)*exp(-x^2-y^2);

% Τα σημεία (x0,y0).
x0 = [0 -1 1 ; 0 1 -1];

% ΘΕΜΑ 4 | Γ

% Γραφικές παραστάσεις για γκ.

% (x0,y0) = (0,0)
subplot(3,1,1)
[X,k] = levenC(f,e,gk,x0(:,1));

Xx1 = X(1,:);
Xy1 = X(2,:);

sub1 = double(subs(f,{x,y},{Xx1(1,:),Xy1(1,:)}));
k = k + 1;

plot(1:k,sub1,'*')
legend('(0,0)')
xlabel('k');
ylabel('f(xk,yk)');

% (x0,y0) = (-1,1)
subplot(3,1,2)
[X,k] = levenC(f,e,gk,x0(:,2));

Xx2 = X(1,:);
Xy2 = X(2,:);

sub2 = double(subs(f,{x,y},{Xx2(1,:),Xy2(1,:)}));
k = k + 1;

plot(1:k,sub2)
legend('(-1,1)')
xlabel('k');
ylabel('f(xk,yk)');

% (x0,y0) = (1,-1)
subplot(3,1,3)
[X,k] = levenC(f,e,gk,x0(:,3));

Xx3 = X(1,:);
Xy3 = X(2,:);

sub3 = double(subs(f,{x,y},{Xx3(1,:),Xy3(1,:)}));
k = k + 1;

plot(1:k,sub3)
legend('(1,-1)')
xlabel('k');
ylabel('f(xk,yk)');