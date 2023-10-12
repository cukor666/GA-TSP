function fitvalue = fitness(pop, D)
%fitness - 计算适应值
%
% Syntax: fitvalue = fitness(pop, D)
%
% Long description
    [px, py] = size(pop);
    fitvalue = zeros(px, 1);
    for i = 1:px
        fitvalue(i) = decode(pop(i, :), D, py);
    end
    fitvalue = 1./fitvalue;
    fitvalue = fitvalue./sum(fitvalue);  % 适应值归一化
end