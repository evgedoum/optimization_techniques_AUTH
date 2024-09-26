function [xk,k] = levenB(f,epsilon,X)
% Δήλωση μεταβλητών.
syms x y;
syms g_value;
d = []; 
k = 1;

% Πίνακας Χ με αρχικό megistikathodosBσημείο (x0,y0).
xk = X;

% Υπολογισμός του grad και του εσσιανού.
grad_f = gradient(f);
hess_f = hessian(f);

max_step = 100;

% Υπολογισμός του grad για (x0,y0).
cal = [double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];

% norm(..) : μέτρο
while (norm(cal) > epsilon)
   
    hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
    eigen_values = eig(hess_matrix);
    
    if (sum(eigen_values < 0) > 0)
        uk = max(abs(eigen_values))+0.2;
    end

    % Βοηθητικές μεταβλητές.
    A = hess_matrix + uk*eye(2);
    B = -double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
            
    % Αποθήκευση τιμών του dk.        
    d = [d linsolve(A,B)];
            
    % Ορισμός func_min(g_value) ως συνάρτησης προς ελαχιστοποίηση.    
    func_min = subs(f,{x,y},{xk(1,k)+g_value*d(1,k),xk(2,k)+g_value*d(2,k)});
        
    % Τιμή του γκ.
    gamm = functionForGamma(func_min,0.1,0,1);
        
    % Υπολογισμός του σημείου (xk+1,yk+1).
    x_new = xk(:,k) + gamm * d(:,k);
    
    % Προσθήκη των νέων σημείων στο πίνακα Χ.
    xk = [xk x_new];
    
    k = k + 1;

    % Υπολογισμός του νέου grad.
    cal = [double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];

end

% Φορές επαναλήψεων/σημείων.
k = k - 1;
end