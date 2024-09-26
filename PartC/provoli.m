function value = provoli(x)
% Είσοδος : x = [x1 x2]

% Περιορισμοί για x1 και x2.
x1 = [-10 5];
x2 = [-8 12];

if x(1) < x1(1)
   x(1) = x1(1);
elseif x(1) > x1(2)
   x(1) = x1(2);
end

if x(2) < x2(1)
    x(2) = x2(1);
elseif x(2) > x2(2)
    x(2) = x2(2);
end

value = [x(1) x(2)];
end