function pop = initpop(popsize, citycount)
%initpop - 初始化种群
%
% Syntax: pop = initpop(popsize, citycount)
%
% Long description
    pop = ones(popsize, citycount);
    for i = 1:popsize
        pop(i, :) = randperm(citycount);
    end
end