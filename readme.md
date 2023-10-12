#### Matlab加载数据

+ *.mat
+ *.txt
+ *.xlsx


通常Matlab的load命令只能加载`*.mat`文件，当`*.txt`的内容是以矩阵的格式呈现也可以直接通过load命令直接加载。
Matlab不能直接加载`*.xlsx`文件，但是也提供了对应的方法读取`*.xlsx`文件。
对`*.xlsx`文件，Matlab提供了`xlsread`函数，用来读取`*.xlsx`文件，当然在Matlab中写一些数据到`*.xlsx`文件中，Matlab也提供了`xlswrite`函数。
`xlsread`函数的用法如下：

```matlab
% Sheet1 = xlsread('*.xlsx', 'Sheet1');	% 读取Sheet1中的数据
% Sheet2 = xlsread('*.xlsx', 'Sheet2');	% 读取Sheet2中的数据
% Default = xlsread('*.xlsx');	% 未指定工作表时，默认读取Sheet1中的数据
```

查看经纬度的网站：
https://map.jiqrxx.com/jingweidu/
