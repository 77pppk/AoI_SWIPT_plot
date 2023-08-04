clear;
c = 3*10^8; f_c = 2.4*10^6; a = 0.5;
tc = [0:0.05:20];
tr1 = [0:0.05:20];
d1 = 23.7;   d2 = d1;               % 21.7403898
PL1 = c/(4*pi*f_c*d1)*exp(-a*d1/2); PL2 = c/(4*pi*f_c*d2)*exp(-a*d2/2);

Pn =  0.01;     % noise power
b1 = 1/(PL1); b2 = 1/(PL2);
Ts = 0.000025;        % 改distance相当于改h   
Pc = 1; D = 300; % packet size
h1 = 8;   h2 = 8;    z1 = h1^2;   z2 = h2^2;    % h is used as power gain
u1 = 0.3; u2 = u1;
% 迭代选取近似点（tr1,tr2），在每个近似点求解近似函数的最小值作为此处原函数的值，遍历更新近似点，直到连续两次迭代求解出的值之差<0.001, 然后将该值与原函数遍历求出的最小值比较（tr1、tr2、AoI）
% 每次迭代更新F值
% 先横向再纵向，tr2 = tr1
F = 1;      n = 2;
for i = 1:length(tr1)
    for j = 1:length(tc)
        tr1_t = tr1(i);                                         tr2_t = tr1_t;
        tc_t = tc(j);
        T_t = tr2_t + tr1_t + tc_t;
        tc1 = tc_t+tr2_t;                                       tc2 = tc_t+tr1_t;           
        
        E1 = u1*z1*tc1.*Pc/b1;                                  E2 = u2*z2*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  

        Pr1 = E1./tr1_t;                                        Pr2 = E2./tr2_t;                
        
        gamma1 = Pr1.*z1./(b1*(Pn+h1*Pc));                      gamma2 = Pr2.*z2./(b2*(Pn+h2*Pc));
        
        r1 = D*Ts./tr1_t;                                       r2 = D*Ts./tr2_t;         % coding rate
        n1 = tr1_t./Ts;                                         n2 = tr2_t./Ts;           % blocklength 
        C1 = log2(1+gamma1);                                    C2 = log2(1+gamma2);    % Shannon capacity
        V1 = (2*gamma1+gamma1.^2)./(1+gamma1).^2;               V2 = (2*gamma2+gamma2.^2)./(1+gamma2).^2;        
        error1 = qfunc(sqrt(n1./V1).*(C1-r1).*log(2));          error2 = qfunc(sqrt(n2./V2).*(C2-r2).*log(2));
        error = max(error1,error2);

        AoI(i,j) = 0.5*T_t+1/F*((T_t+F/(1-error))/n)^2;
        
        if isnan(AoI(i,j))
            F = 1;
        else
            F = -((1-error)^2*(2*T_t/(1-error)+2*T_t-4*AoI(i,j)))/2;
        end
    end
end

AoI(AoI > 100) = NaN;
p3 = surf(tr1,tc,AoI);set(gca,'ZScale','log');shading interp;hold on;
xlabel('tr1');ylabel('tc');zlabel('max');title('h1 = h2');
% 结果最小值对应tr1和tr2与原函数相同，近似最优值高于原函数最优值