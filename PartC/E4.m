% ΘΕΜΑ 4

% Δήλωση μεταβλητών, όπου x=x1 και y=x2.
syms x y;

% Συνάρτηση προς μελέτη.
f = (1/3)*x^2 + 3*y^2;

% Τιμές για το ε, γκ και sκ.
e = 0.01;
gk = 0.2;
sk = 0.1;

% Σημείο εκκίνησης (x0,y0).
x0 = 8;
y0 = -10;

% Γραφικές παραστάσεις.
[x1,x2,f_xk,k] = mkathodosprovoli(f,e,gk,x0,y0,sk,300);

subplot(2,1,1)
plot(x1,x2,'-x')
hold on;
fcontour(f,[-10 5 -8 12]);
xlabel('x1');
ylabel('x2');

subplot(2,1,2)
plot(0:k,f_xk)
xlabel('k');
ylabel('f(x1k,x2k)');

