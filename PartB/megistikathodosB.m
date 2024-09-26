function [xk,k] = megistikathodosB(f,epsilon,X)
% Δήλωση μεταβλητών.
syms x y;
syms g_value;
k = 1; 
d = []; 

% Πίνακας Χ με αρχικό megistikathodosBσημείο (x0,y0).
xk = X;


% Υπολογισμός του grad.
grad_f = gradient(f); 
        
% Υπολογισμός του grad για (x0,y0).
cal = [double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];

% norm(..) : μέτρο
while (norm(cal) >= epsilon)
      % Υπολογισμός του dk.      
      d = [d -double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];
      
      % Βοηθητικές μεταβλητές.
      D1 = double(xk(1,k));
      D2 = double(xk(2,k));
      
      % Ορισμός func_min(g_value) ως συνάρτησης προς ελαχιστοποίηση.
      func_min = subs(f,{x,y},{D1 + g_value * d(1,k) , D2 + g_value * d(2,k)});
      
      % Τιμή του γκ.
      gamm = functionForGamma(func_min,0.01,0,1);
      
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