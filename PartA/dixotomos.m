% dixotomos.m

function [a,b,k,e,l] = dixotomos(f,epsilon,lambda)

k = 1; 
a = []; 
b = [];
l = lambda;
e = epsilon;

%arxikopoihsh
a(k) = -1; b(k) = 3;

% 1st case
while b(k) - a(k) < lambda
   return
end

% 2nd case
while b(k)-a(k) > lambda
    x_1_k = (a(k) + b(k))/2 - epsilon;
    x_2_k = (a(k) + b(k))/2 + epsilon;
    
    if subs(f,x_1_k) < subs(f,x_2_k)
        a(k+1) = a(k);
        b(k+1) = x_2_k;

    elseif subs(f,x_1_k) > subs(f,x_2_k)
        a(k+1) = x_1_k;
        b(k+1) = b(k);
    end

    k = k + 1;
end
k = k - 1;
end