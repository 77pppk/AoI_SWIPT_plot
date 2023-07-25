clear;

run parameters_f1_5.m;

run f1.m;

run f2.m;

run parameters_f1_5.m;
tc_f3 = 0;     dt = [0:0.1:20];    tr1_x = 14;      tr2_x = 9;     
%tr1_x = 14.7;      tr2_x = 9.85;  % 将tr1、tr2初始值设为tc=0时的最优解，f3中tr1和tr2线很近，减小初始值可使其分离
run f3.m;

h1_f4 = [0:1:10]; 
run f4.m;

run parameters_f1_5.m;
h1_f5 = [0:0.5:15];
run f5.m;

run parameters_f1_5.m;
D1_f6 = 0:0.1:20;
run f6.m;

run plot_figure.m;