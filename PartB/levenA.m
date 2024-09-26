function [xk,k] = levenA(f,epsilon,gamma,X)
d = []; 
k = 1;
xk = X;

grad_f = gradient(f);
hess_f = hessian(f);

cal = [double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];

while (norm(cal) > epsilon)
           
            hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
            eigen_values = eig(hess_matrix);
            
            if (sum(eigen_values < 0) > 0)
                uk = max(abs(eigen_values))+0.2;
            end
            
            % Βοηθητικές μεταβλητές.
            A = hess_matrix + uk*eye(2);
            B = -double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
           
            % Υπολογισμός του dk. 
            d = [d linsolve(A,B)];
            
            % Υπολογισμός του σημείου (xk+1,yk+1).
            x_new = xk(:,k) + gamma * d(:,k);

            % Προσθήκη των νέων σημείων στο πίνακα Χ.
            xk = [xk x_new];
            
            k = k + 1;

            % Υπολογισμός νέου grad.
            cal = [double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];
end

% Φορές επαναλήψεων/σημείων.
k = k - 1;
end