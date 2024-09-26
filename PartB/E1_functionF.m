% Μεταβλητές x,y
syms x y;

% Συνάρτηση f(x,y) και ενδεικτικές τιμές μεταβλητών
x=-4:0.1:4;
y=-4:0.1:4;

f=(x.^5).*exp(-x.^2-y.^2);

% Οπτικοποίηση συνάρτησης
figure('Name','Γραφική παράσταση συνάρτησης f(x)','NumberTitle','on')
plot3(x,y,f);
xlabel x;
ylabel y;
zlabel z;