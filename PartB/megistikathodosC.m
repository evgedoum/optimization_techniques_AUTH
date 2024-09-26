function [xk,k] = megistikathodosC(f,epsilon,gamm,X)
% Δήλωση μεταβλητών.
syms x y;
d = []; 
k = 1; 

% Πίνακας Χ με αρχικό σημείο (x0,y0).
xk = X;

% Υπολογισμός του grad.
grad_f = gradient(f);

% Ορισμός παραμέτρων Armijo.
mk = 0;
a = 2*10^(-3);
b = 1/4;
s = gamm * b^mk;
 
% Υπολογισμός του grad για (x0,y0).
cal = [double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];

% norm(..) : μέτρο
while (norm(cal) > epsilon)
        % Υπολογισμός του dk.  
        d = [d -double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];
         
        % Υπολογισμός του f(xk,yk).  
        fx_k = double(subs(f,{x,y},{xk(1,k),xk(2,k)}));

        grad_matrix = double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
        
        while (fx_k - double(subs(f,{x,y},{xk(1,k)+gamm*d(1,k),xk(2,k)+gamm*d(2,k)})) < -a * b^mk * s * d(:,k)' * grad_matrix)
            mk = mk + 1;
            gamm = s * b^mk;
        end
            
        % Υπολογισμός του σημείου (xk+1,yk+1).
        x_new = xk(:,k) + gamm * d(:,k);

        % Προσθήκη των νέων σημείων στο πίνακα Χ.
        xk = [xk x_new];
            
        k = k + 1;
            
        % Ορισμός mk ως μηδέν για τη επόμενη επανάληψη.
        mk = 0;
        gamm = s * b^mk;

        % Υπολογισμός νέου grad.
        cal = [double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];
end   

% Φορές επαναλήψεων/σημείων.
k = k - 1;
end