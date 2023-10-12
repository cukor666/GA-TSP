function D = Distance(city)
%Distance - 计算两个城市之间的距离
%
% Syntax: D = Distance(city)
%
% Long 返回的是一个距离对称矩阵，记录着第i个城市到第j个城市的距离
    [n, ~] = size(city);
    D = ones(n, n);
    for i = 1:n
        for j = i:n
            D(i, j) = sqrt((city(i, 1) - city(j, 1)).^2 + (city(i, 2) - city(j, 2)).^2);
            D(j, i) = D(i, j);
        end
    end
end