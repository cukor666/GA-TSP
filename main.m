%% 遗传算法解决旅行商问题
%% 清屏
clear; close; clc; 
%% 加载数据
city = xlsread('./resources/city.xlsx');    % 加载Excel表格数据
%% 参数初始化
% 主要的参数
popsize = 200;                              % 种群大小
pc = 0.9;                                   % 交叉概率
pm = 0.05;                                  % 变异概率
gen = 1000;                                 % 迭代次数
% 次要的参数            
D = Distance(city);                         % 城市距离矩阵
[citycount, ~] = size(city);                % 记录城市个数
best_fitvalue = zeros(gen, 1);              % 记录每一代最优的适应值
minlen = zeros(gen, 1);                     % 记录每一代路径最小值
%% 初始化种群
pop = initpop(popsize, citycount);
%% 开始迭代
for it = 1:gen
    fitvalue = fitness(pop, D);                                         % 计算适应值
    [best_fitvalue(it), best_index] = max(fitvalue);                    % 记录适应值最高的值与下标
    best_solution = pop(best_index, :);                                 % 记录当前代的最优个体
    minlen(it) = decode(best_solution, D, citycount);                   % 记录每一代的最短路径
    newpop = parent_selection(pop, fitvalue);                           % 父体选择
    newpop = crossover(newpop, pc);                                     % 交叉
    newpop = mutation(newpop, pm);                                      % 变异
    pop = newpop;                                                       % 更新种群
    pop(mod(ceil(rand * citycount), citycount)+1,  :) = best_solution;  % 保留最优个体
end
%% 画图
figure(1)
for i = 2:citycount
    plot([city(best_solution(i-1), 1), city(best_solution(i), 1)], ...
         [city(best_solution(i-1), 2), city(best_solution(i), 2)], 'bo-');
    hold on;
end
plot([city(best_solution(citycount), 1), city(best_solution(1), 1)], ...
     [city(best_solution(citycount), 2), city(best_solution(1), 2)], 'ro-');
title(['优化最短距离：', num2str(min(minlen))]);

figure(2)
plot(best_fitvalue);
xlabel('迭代次数')
ylabel('目标函数值')
title('适应值变化曲线')

figure(3)
plot(minlen);
xlabel('迭代次数')
ylabel('目标函数值')
title('最短路径变化曲线')

%% 打印周游路线
disp('周游路线:')
words = num2str(best_solution(1));
for i = 2:citycount
   words = append(words, '->', num2str(best_solution(i)));
end
words = append(words, '->', num2str(best_solution(1)));
disp(words);