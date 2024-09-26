% fibonacciM.m

function [a,b,k,l,e,n,counter] = fibonacciM(f,lambda,epsilon)

a = [];
b = [];
l = lambda;
e = epsilon;

n = 0;
k = 1;

% arxiko diastima
a(k) = -1; b(k) = 3;


while fibonacci(n) <= ((b(1) - a(1))/lambda)
    n = n + 1;
end

% arxikopoihsh twn x
x_1_k = a(1) + (fibonacci(n-2)/fibonacci(n)) * (b(1) - a(1));
x_2_k = a(1) + (fibonacci(n-1)/fibonacci(n)) * (b(1) - a(1));
    
s1 = subs(f,x_1_k);
s2 = subs(f,x_2_k);
counter = 2; % timh 2 gia ta arxika s1 kai s2

while k < (n - 2) 
    
    %vima 2
   if s1 > s2  
        a(k+1) = x_1_k;
        b(k+1) = b(k); 
        
        x_1_k = x_2_k; 
        x_2_k = a(k+1) + (fibonacci(n-k-1)/fibonacci(n-k)) * (b(k+1) - a(k+1));

        s1 = s2;
        s2 = subs(f,x_2_k);
        counter = counter + 1;

        %vima 5
        if k == (n - 2) 
            x_1_n = x_1_k;
            x_2_n = x_1_k + epsilon;
            
            if s1 > subs(f,x_2_n)
                a(n) = x_1_n;
                b(n) = b(n-1);
                counter = counter + 1;
            else
            a(n) = a(n-1);
            b(n) = x_2_n;
            end
        end
    
    %vima 3
   elseif s1 < s2 
        a(k+1) = a(k);
        b(k+1) = x_2_k;
        
        x_2_k = x_1_k;
        x_1_k = a(k+1) + (fibonacci(n-k-2)/fibonacci(n-k)) * (b(k+1) - a(k+1));
        
        s2 = s1;
        s1 = subs(f,x_1_k);
        counter = counter + 1;
    
    
        %vima 5
        if k == (n - 2)
            x_1_n = x_1_k;
            x_2_n = x_1_k + epsilon;
            
            if s1 > subs(f,x_2_n)
                a(n) = x_1_n;
                b(n) = b(n-1);
                counter = counter + 1;
            else
                a(n) = a(n-1);
                b(n) = x_2_n;
            end
        end

   end
    k = k + 1;
end  
k = k-1;
end