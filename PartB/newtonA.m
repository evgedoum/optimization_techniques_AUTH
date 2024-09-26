function [xk,k] = newtonA(f,epsilon,gamma,X)
% Δήλωση μεταβλητών.
d = []; 
k = 1;

% Πίνακας Χ με αρχικό σημείο (x0,y0).
xk = X;

% Υπολογισμός του grad και του εσσιανού.
grad_f = gradient(f);
hess_f = hessian(f);

% Υπολογισμός του grad για (x0,y0).
cal = [double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];

% norm(..) : μέτρο
while (norm(cal) > epsilon)
            
         grad_matrix = double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
         hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
         
         % Αποθήκευση τιμών του dk.
         d = [d -hess_matrix\grad_matrix];
         
         % Υπολογισμός του σημείου (xk+1,yk+1).
         x_k = xk(:,k) + gamma * d(:,k);
         xk = [xk x_k];
         k = k + 1;
         
         % Υπολογισμός του νέου grad.
         cal = [double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];
end

% Φορές επαναλήψεων/σημείων.
k = k - 1;
end