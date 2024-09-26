function [X,k] = megistikathodos(f,epsilon,x_k,y_k,gk)
% Δήλωση μεταβλητών.
syms x y;

k = 1;
max_step = 100;

% Πίνακας Χ με αρχικό σημείο (x0,y0).
X = [x_k ; y_k];

% Υπολογισμός του grad και μετατροπή σε συναρτήσεις.
anadelta = gradient(f);
dx = @(x,y) anadelta(1);
dy = @(x,y) anadelta(2);

% Υπολογισμός του grad για (x0,y0).
cal = [double(subs(dx,{x,y},{x_k,y_k})); double(subs(dy,{x,y},{x_k,y_k}))];

% norm(..) : μέτρο
while (norm(cal) > epsilon && k<max_step)

    % Υπολογισμός του σημείου (xk+1,yk+1).
    x_k = double(x_k - gk * cal(1));
    y_k = double(y_k - gk * cal(2));

    % Υπολογισμός του grad για (xk+1,yk+1).
    cal = [subs(dx,{x,y},{x_k,y_k}); subs(dy,{x,y},{x_k,y_k})];

    % Προσθήκη των νέων σημείων στο πίνακα Χ.
    xnew = [x_k ; y_k];
    X = [X  xnew];
    k = k + 1;
end

% Φορές επαναλήψεων/σημείων.
k = k - 1;
end
