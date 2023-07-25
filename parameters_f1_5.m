% use 'run parameters.m' in main program to load those parameters
% 以下为除f1以外的图像的参数，用于加入tc的优化问题，u1、u2的值改变

tc = [0:0.2:20];
tr1 = [0:0.2:20];
tr2 = [0:0.2:20]; % 以上变量单位均为s

D1 = 10;   D2 = 10;  b1 = D1^2.7; b2 = D2^2.7; Ts = 0.000025; Pn =  0.01;       % 改distance相当于改h   
Pc = 1; d = 300; 
h1 = 8;   h2 = 7;    z1 = h1^2;   z2 = h2^2;    % h is used as power gain
u1 = 0.3; u2 = u1;
h = [8 8 8; 8 7 6];% 第一行h1第二行h2

% f2中变量为d


