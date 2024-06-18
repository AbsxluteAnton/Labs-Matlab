clear all
clc
close all
% st_cond: 0,','',...;  coef: 1,X,X',X''...
s = eqv_sol(2,[-1,2],@(t) -4*t-5,[0,-4,-3,1]);
fprintf('solution: x(t)= %s\n',s)
function [solution]=eqv_sol(n,st_cond,right_part,coef)
    arguments    
        n double % Число
        st_cond (:,:) double % Двумерный массив
        right_part (1,1) sym % Символьная функция
        coef (:,:) double % Двумерный массив
    end
    if n~=length(st_cond)
       disp('error')
       return;
    end
    syms p X t
    d = sym('d', [1, n]);
    for i = 1:n
        term = p^i * X;
        for k = 0:i-1
            term = term - p^(i-k-1) * st_cond(k+1);
        end
        d(i) = term;
    end
    d = [laplace(1,p),X,d];
    array = coef.*d;
    cur = 0;
    for j=1:length(array)
        cur = cur + array(j);
    end
    equal=cur == laplace(right_part,p);
    solution = ilaplace(solve(equal,X),t);
end


