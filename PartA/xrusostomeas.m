% xrusostomeas.m

function [a,b,k,l,counter] = xrusostomeas(f,lambda)

k = 1;
a = [];
b = [];
l = lambda;
g = 0.618;


% arxiko diastima
a(k) = -1; b(k) = 3;

% arxikopoihsh twn x
x_1_k = a(1) + (1 - g) * (b(1) - a(1));
x_2_k = a(1) + g * (b(1) - a(1));
s1 = subs (f, x_1_k);
s2 = subs (f, x_2_k);
counter = 2; % timh 2 gia ta arxika s1 kai s2

% 1st case
while b(k) - a(k) < lambda
    return
end

% 2nd case
while b(k) - a(k) >= lambda
    if s1 > s2
        a(k+1) = x_1_k;
        b(k+1) = b(k);

        %gia to epomeno k
        x_1_k = x_2_k;   
        x_2_k = a(k+1)  + g * (b(k+1) - a(k+1));
       
        s1 = s2;
        s2 = subs (f,x_2_k);
        counter = counter + 1;

    elseif s1 < s2
         a(k+1) = a(k);
         b(k+1) = x_2_k;

         % gia to epomeno k
         x_2_k = x_1_k;
         x_1_k = a(k+1) + (1 - g) * (b(k+1) - a(k+1));

         s2 = s1;
         s1 = subs (f, x_1_k);
         counter = counter + 1;
    end
    k = k + 1;
end
k = k - 1;