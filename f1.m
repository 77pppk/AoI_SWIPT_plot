%%%%%%%%%%%%%%%%%%%%%%%%%% figure 1 %%%%%%%%%%%%%%%%%%%%%%%       
% 图1中参数不动，改图2-5
tc_f1 = 0; 
tr1_f1 = [0:0.05:20];
tr2_f1 = [0:0.05:20];


for i = 1:max(size(tr1_f1))
    T_f1(i,:) = tc_f1+tr1_f1(i)+tr2_f1;
end


tc1_f1 = tc_f1+tr2_f1;                                           tc2_f1 = (tc_f1+tr1_f1)';           

E1_f1 = u1*z1*tc1_f1.*Pc/b1;                                  E2_f1 = u2*z2*tc2_f1.*Pc/b2;      %b1、b2是论文中D^2.7  
for i = 1:max(size(tr1_f1))
 Pr1_f1(i,:) = E1_f1./tr1_f1(i);
end
for i = 1:max(size(tr2_f1))
 Pr2_f1(:,i) = E2_f1./tr2_f1(i);
end


gamma1_f1 = Pr1_f1.*z1./(b1*(Pn+h1*Pc));                      gamma2_f1 = Pr2_f1.*z2./(b2*(Pn+h2*Pc));

r1_f1 = D*Ts./tr1_f1;                                         r2_f1 = D*Ts./tr2_f1;         % coding rate
r1_f1 = (repmat(r1_f1,max(size(tr1_f1)),1))';                 r2_f1 = (repmat(r2_f1,max(size(tr2_f1)),1));
n1_f1 = tr1_f1./Ts;                                           n2_f1 = tr2_f1./Ts;           % blocklength 
n1_f1 = (repmat(n1_f1,max(size(tr1_f1)),1))';                 n2_f1 = (repmat(n2_f1,max(size(tr2_f1)),1));
C1_f1 = log2(1+gamma1_f1);                                    C2_f1 = log2(1+gamma2_f1);    % Shannon capacity
V1_f1 = (2*gamma1_f1+gamma1_f1.^2)./(1+gamma1_f1).^2;         V2_f1 = (2*gamma2_f1+gamma2_f1.^2)./(1+gamma2_f1).^2;

error1_f1 = qfunc(sqrt(n1_f1./V1_f1).*(C1_f1-r1_f1).*log(2));          error2_f1 = qfunc(sqrt(n2_f1./V2_f1).*(C2_f1-r2_f1).*log(2));

Del1_f1 = 0.5*T_f1+T_f1./(1-error1_f1);                             Del2_f1 = 0.5*T_f1+T_f1./(1-error2_f1);

Del_f1 = max(Del1_f1,Del2_f1); Del_f1(find(Del_f1 > 60)) = NaN;

