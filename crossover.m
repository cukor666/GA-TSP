function newpop = crossover(pop, pc)
%crossover - 交叉
%
% Syntax: newpop = crossover(pop, pc)
%
% Long description
    [px, ~] = size(pop);
    newpop = pop;
    for i = 2:2:px
        if rand <= pc
            [newpop(i, :), newpop(i-1, :)] = sub_crossover(pop(i, :), pop(i-1, :));
        end
    end
end

function [newcode1, newcode2] = sub_crossover(code1, code2)
%sub_crossover - 子交叉函数
%
% Syntax: [newcode1, newcode2] = sub_crossover(code1, code2)
%
% Long 采用次序杂交的方式进行杂交
    newcode1 = code1;
    newcode2 = code2;
    n = length(code1);
    front = -1;
    rear = -1;
    while front < 1 || rear <= front || rear >= n
        front = ceil(rand * n);
        rear = ceil(rand * n);
    end
    p1 = code1;
    p2 = code2;
    for i = front:rear
        p2(p2 == code1(i)) = [];
        p1(p1 == code2(i)) = [];
    end
    j = 1;
    for i = 1:n
        if i < front || i > rear
            newcode1(i) = p2(j);
            newcode2(i) = p1(j);
            j = j + 1;
        end
    end
end