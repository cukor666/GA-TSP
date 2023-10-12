function newpop = parent_selection(pop, fitvalue)
%parent_selection - 父体选择
%
% Syntax: newpop = parent_selection(pop, fitvalue)
%
% Long description
    [px, py] = size(pop);
    newpop = zeros(px, py);
    %% 设计轮盘
    p = cumsum(fitvalue);   % 在计算适应值函数中已经做好归一化
    %% 转动轮盘
    r = sort(rand(px, 1));
    j = 1;
    for i = 1:px
        while r(i) > p(j)
            j = j + 1;
        end
        % r(i) <= p(j)
        newpop(i, :) = pop(j, :);
    end
end