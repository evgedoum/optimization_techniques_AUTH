function [value] = functionForGamma(f,lambda,x_0,x_k)
% Δήλωση μεταβλητών.
syms x;
n = 1; 
g = 0.618; 
l = lambda; 

a = []; 
b = [];

% Αρχικές τιμές.
a(n) = x_0; 
b(n) = x_k;

% Μέθοδος Χρυσού Τομέα.

% Υπολογισμός x1 και y1.
x_1 = a(n) + (1 - g)*(b(n) - a(n));
x_2 = a(n) + g*(b(n) - a(n));
s1 = double(subs(f,x_1));
s2 = double(subs(f,x_2));

while b(n)-a(n)>l
    n = n + 1;
    if s1 > s2
        a(n) = x_1;
        b(n) = b(n-1);
        x_1 = x_2;
        x_2 = a(n) + g*(b(n) - a(n));
    else
        a(n) = a(n-1);
        b(n) = x_2;
        x_2 = x_1;
        x_1 = a(n) + (1 - g)*(b(n) - a(n));
    end
end

% Επιθυμητή τιμή γκ.
value = (a(n)+b(n))/2;
end