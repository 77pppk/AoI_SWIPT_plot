% use 'run parameters.m' in main program to load those parameters
% 以下为除f1以外的图像的参数，用于加入tc的优化问题，u1、u2的值改变
c = 3*10^8; f_c = 2.4*10^6; a = 0.5;
tc = [0:0.2:20];
tr1 = [0:0.2:20];
tr2 = [0:0.2:20]; % 以上变量单位均为s

d1 = 21.7403898;   d2 = d1;  
% Rayleigh fading (passloss)
PL1 = c/(4*pi*f_c*d1)*exp(-a*d1/2); PL2 = c/(4*pi*f_c*d2)*exp(-a*d2/2);

Pn =  0.01;     % noise power
b1 = 1/(PL1); b2 = 1/(PL2);
Ts = 0.000025;        % 改distance相当于改h   
Pc = 1; D = 300; % packet size
h1 = 8;   h2 = 7;    z1 = h1^2;   z2 = h2^2;    % h is used as power gain
u1 = 0.3; u2 = u1;
h = [8 8 8; 8 7 6];% 第一行h1第二行h2

b3 = b1;    b4 = b1;    b5 = b1;
u3 = u1;    u4 = u1;    u5 = u1;
h3 = h1;    h4 = h1;    h5 = h1;

z3 = h3^2;  z4 = h4^2; z5 = h5^2;