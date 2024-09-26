% dixotomospar.m

function [a,b,k,l,n] = dixotomospar(f,lambda)

a = [];
b = [];
n = 0;
k = 1;
l = lambda;

syms x;
df = diff(f);

%arxikopoihsh
a(k) = -1; b(k) = 3;

while ((1/2)^n) > (lambda/(b(1)-a(1)))
  n = n + 1;
end

while k <= n
    %vima 1
    x_k = (a(k)+b(k))/2;
    y = subs(df, x_k);
    
    if y == 0
        return
    
    %vima 2
    elseif y > 0
        a(k+1) = a(k);
        b(k+1) = x_k;

    %vima 3
    elseif y < 0
        a(k+1) = x_k;
        b(k+1) = b(k);
    end
 
     k = k + 1;
 end

 k = k-1;
  
end

