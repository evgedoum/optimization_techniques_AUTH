function [x1,x2,f_xk,k]= mkathodosprovoli(f,epsilon,gk,x1,x2,sk,step)
% Δήλωση μεταβλητών.
syms x y;
k = 1;
max_step = step;

X = [x1;x2];

% Υπολογισμός σημείων της προβολής.
xk = provoli(X);

% Υπολογισμός του grad.
grad_f = gradient(f);

% Αποθήκευση αρχικών τιμών του πίνακα σε μεταβλητές(από προβολή).
x1 = xk(1);
x2 = xk(2);

% Υπολογισμός της συνάρτησης f για τα νέα (x1,x2).
f_xk = subs(f,{x,y},{xk(1), xk(2)});

% Υπολογισμός του grad για τα νέα (x1,x2).
cal = subs(grad_f,{x,y},{x1, x2});

% norm(...) : μέτρο
while (norm(cal) > epsilon && k < max_step) 
    
    % Υπολογισμός του νέου πίνακα xk (για το επόμενο k).
    pro = provoli(xk - (sk*(subs(grad_f,{x,y},{xk(1),xk(2)})).')) - xk;
    xk = xk + gk*pro;
     
    % Αποθήκευση της τιμής της συνάρτησης για κάθε νέά xk.
    f_xk = [f_xk, subs(f,{x,y},{xk(1), xk(2)})];
    
    % Αποθήκευση νέων xk.
    x1 = [x1, xk(1)];
    x2 = [x2, xk(2)];
    
    cal = subs(grad_f,{x,y},{xk(1),xk(2)});

    k = k + 1;
end
k = k - 1;
end