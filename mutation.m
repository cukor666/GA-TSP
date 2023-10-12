function newpop = mutation(pop, pm)
%mutation - 变异
%
% Syntax: newpop = mutation(pop, pm)
%
% Long 采用互换变异算子
    [px, py] = size(pop);
    newpop = pop;
    cnt = ceil(rand*py/2);      % 确定变异点的个数
    pos = mod(ceil(rand(px, cnt) * py), py) + 1;  % 变异点的位置
    for i = 1:px
        if rand <= pm
            for j = 2:2:cnt
                temp = newpop(i, pos(i, j));
                newpop(i, pos(i, j)) = newpop(i, pos(i, j-1));
                newpop(i, pos(i, j-1)) = temp;
            end
        end
    end
end