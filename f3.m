% 图像会随初始tr1，tr2设置改变

% tr1_x = 12;      tr2_x = 7;


% 1.。。。。。。。。。。   dt放入tc    。。。。。。。。。。。。。。。
tc_f3 = dt; tr1_f3 = tr1_x; tr2_f3 = tr2_x;
T_f3 = tc_f3+tr1_f3+tr2_f3;
tc1_f3 = tc_f3+tr2_f3;                                     tc2_f3 = tc_f3+tr1_f3;           

E1_f3 = u1*z1*tc1_f3.*Pc/b1;                               E2_f3 = u2*z2*tc2_f3.*Pc/b2;      %b1、b2是论文中D^2.7  
Pr1_f3 = E1_f3./tr1_f3;                                    Pr2_f3 = E2_f3./tr2_f3;
gamma1_f3 = Pr1_f3.*z1./(b1*(Pn+h1*Pc));                   gamma2_f3 = Pr2_f3.*z2./(b2*(Pn+h2*Pc));

r1_f3 = D*Ts./tr1_f3;                                      r2_f3 = D*Ts./tr2_f3;         % coding rate
n1_f3 = tr1_f3./Ts;                                        n2_f3 = tr2_f3./Ts;           % blocklength 
C1_f3 = log2(1+gamma1_f3);                                 C2_f3 = log2(1+gamma2_f3);    % Shannon capacity
V1_f3 = (2*gamma1_f3+gamma1_f3.^2)./(1+gamma1_f3).^2;      V2_f3 = (2*gamma2_f3+gamma2_f3.^2)./(1+gamma2_f3).^2;

error1_f3 = qfunc(sqrt(n1_f3./V1_f3).*(C1_f3-r1_f3).*log(2));          error2_f3 = qfunc(sqrt(n2_f3./V2_f3).*(C2_f3-r2_f3).*log(2));
Del1_f3 = 0.5*T_f3+T_f3./(1-error1_f3);                             Del2_f3 = 0.5*T_f3+T_f3./(1-error2_f3);
A1_f3 = max(Del1_f3,Del2_f3);        A1_f3(A1_f3 > 1000) = NaN;

% 2.。。。。。。。。。。   dt放入tr1    。。。。。。。。。。。。。。。
tc_f3 = 0; tr1_f3 = tr1_x+dt; tr2_f3 = tr2_x;
T_f3 = tc_f3+tr1_f3+tr2_f3;
tc1_f3 = tc_f3+tr2_f3;                                           tc2_f3 = tc_f3+tr1_f3;           

E1_f3 = u1*z1*tc1_f3.*Pc/b1;                                  E2_f3 = u2*z2*tc2_f3.*Pc/b2;      %b1、b2是论文中D^2.7  
Pr1_f3 = E1_f3./tr1_f3;                                          Pr2_f3 = E2_f3./tr2_f3;
gamma1_f3 = Pr1_f3.*z1./(b1*(Pn+h1*Pc));                      gamma2_f3 = Pr2_f3.*z2./(b2*(Pn+h2*Pc));

r1_f3 = D*Ts./tr1_f3;                                         r2_f3 = D*Ts./tr2_f3;         % coding rate
n1_f3 = tr1_f3./Ts;                                           n2_f3 = tr2_f3./Ts;           % blocklength 
C1_f3 = log2(1+gamma1_f3);                                    C2_f3 = log2(1+gamma2_f3);    % Shannon capacity
V1_f3 = (2*gamma1_f3+gamma1_f3.^2)./(1+gamma1_f3).^2;               V2_f3 = (2*gamma2_f3+gamma2_f3.^2)./(1+gamma2_f3).^2;

error1_f3 = qfunc(sqrt(n1_f3./V1_f3).*(C1_f3-r1_f3).*log(2));          error2_f3 = qfunc(sqrt(n2_f3./V2_f3).*(C2_f3-r2_f3).*log(2));
Del1_f3 = 0.5*T_f3+T_f3./(1-error1_f3);                             Del2_f3 = 0.5*T_f3+T_f3./(1-error2_f3);
A2_f3 = max(Del1_f3,Del2_f3);        A2_f3(A2_f3 > 1000) = NaN;


% 3.。。。。。。。。。。   dt放入tr2    。。。。。。。。。。。。。。。
tc_f3 = 0; tr1_f3 = tr1_x; tr2_f3 = tr2_x+dt;
T_f3 = tc_f3+tr1_f3+tr2_f3;
tc1_f3 = tc_f3+tr2_f3;                                           tc2_f3 = tc_f3+tr1_f3;           

E1_f3 = u1*z1*tc1_f3.*Pc/b1;                                  E2_f3 = u2*z2*tc2_f3.*Pc/b2;      %b1、b2是论文中D^2.7  
Pr1_f3 = E1_f3./tr1_f3;                                          Pr2_f3 = E2_f3./tr2_f3;
gamma1_f3 = Pr1_f3.*z1./(b1*(Pn+h1*Pc));                      gamma2_f3 = Pr2_f3.*z2./(b2*(Pn+h2*Pc));

r1_f3 = D*Ts./tr1_f3;                                         r2_f3 = D*Ts./tr2_f3;         % coding rate
n1_f3 = tr1_f3./Ts;                                           n2_f3 = tr2_f3./Ts;           % blocklength 
C1_f3 = log2(1+gamma1_f3);                                    C2_f3 = log2(1+gamma2_f3);    % Shannon capacity
V1_f3 = (2*gamma1_f3+gamma1_f3.^2)./(1+gamma1_f3).^2;               V2_f3 = (2*gamma2_f3+gamma2_f3.^2)./(1+gamma2_f3).^2;

error1_f3 = qfunc(sqrt(n1_f3./V1_f3).*(C1_f3-r1_f3).*log(2));          error2_f3 = qfunc(sqrt(n2_f3./V2_f3).*(C2_f3-r2_f3).*log(2));
Del1_f3 = 0.5*T_f3+T_f3./(1-error1_f3);                             Del2_f3 = 0.5*T_f3+T_f3./(1-error2_f3);
A3_f3 = max(Del1_f3,Del2_f3);        A3_f3(A3_f3 > 1000) = NaN;
