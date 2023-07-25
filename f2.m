% t afret variable name means "threshold"
% f2中对三种参数设置计算有无阈值的情况，subplot(3,1,n),三行一列，每行中为一组参数设置下有无阈值的曲线

d_f2 = [0:20:1200];
for i = 1:max(size(tr1))
    T(i,:) = tc+tr1(i)+tr2;
end
TT = T;
for i = 1:length(tc)
    T(:,:,i) = TT+tc(i);
end
tc1 = T(1,:,:);                                           tc2 = T(:,1,:);           

% h1 = h2
h1 = h(1,1); h2 = h(2,1);z1 = h1^2;   z2 = h2^2;
for j = 1:length(d_f2)
    E1_f2 = u1*z1*tc1.*Pc/b1;                                  E2_f2 = u2*z2*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f2(i,:,:) = E1_f2./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f2(:,i,:) = E2_f2./tr2(i);
    end
    gamma1_f2 = Pr1_f2.*z1./(b1*(Pn+h1*Pc));                      gamma2_f2 = Pr2_f2.*z2./(b2*(Pn+h2*Pc));
    
    r1_f2 = d_f2(j)*Ts./tr1;                                      r2_f2 = d_f2(j)*Ts./tr2;         % coding rate
    r1_f2 = (repmat(r1_f2,max(size(tr1)),1))';                    r2_f2 = (repmat(r2_f2,max(size(tr2)),1));
    r1_f2 = repmat(r1_f2,[1 1 length(tr1)]);                      r2_f2 = repmat(r2_f2,[1 1 length(tr2)]);
    n1_f2 = tr1./Ts;                                              n2_f2 = tr2./Ts;           % blocklength 
    n1_f2 = (repmat(n1_f2,max(size(tr1)),1))';                    n2_f2 = (repmat(n2_f2,max(size(tr2)),1));
    n1_f2 = repmat(n1_f2,[1 1 length(tr1)]);                      n2_f2 = repmat(n2_f2,[1 1 length(tr2)]);
    C1_f2 = log2(1+gamma1_f2);                                    C2_f2 = log2(1+gamma2_f2);    % Shannon capacity
    V1_f2 = (2*gamma1_f2+gamma1_f2.^2)./(1+gamma1_f2).^2;         V2_f2 = (2*gamma2_f2+gamma2_f2.^2)./(1+gamma2_f2).^2;
    
    error1_f2 = qfunc(sqrt(n1_f2./V1_f2).*(C1_f2-r1_f2).*log(2));          error2_f2 = qfunc(sqrt(n2_f2./V2_f2).*(C2_f2-r2_f2).*log(2));
    Del1_f2 = 0.5*T+T./(1-error1_f2);                             Del2_f2 = 0.5*T+T./(1-error2_f2);
    
    Del_f2 = max(Del1_f2,Del2_f2);
    Del_f2(error1_f2 > 0.1) = NaN;                                Del_f2(error2_f2 > 0.1) = NaN;
    

    mAOI1_t_f2(j) = min(min(min(Del_f2)));
end

% h1 > h2
h1 = h(1,2); h2 = h(2,2);z1 = h1^2;   z2 = h2^2;
for j = 1:length(d_f2)
    E1_f2 = u1*z1*tc1.*Pc/b1;                                  E2_f2 = u2*z2*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f2(i,:,:) = E1_f2./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f2(:,i,:) = (E2_f2./tr2(i));
    end
    gamma1_f2 = Pr1_f2.*z1./(b1*(Pn+h1*Pc));                      gamma2_f2 = Pr2_f2.*z2./(b2*(Pn+h2*Pc));
    
    r1_f2 = d_f2(j)*Ts./tr1;                                      r2_f2 = d_f2(j)*Ts./tr2;         % coding rate
    r1_f2 = (repmat(r1_f2,max(size(tr1)),1))';                     r2_f2 = (repmat(r2_f2,max(size(tr2)),1));
    r1_f2 = repmat(r1_f2,[1 1 length(tr1)]);                      r2_f2 = repmat(r2_f2,[1 1 length(tr2)]);
    n1_f2 = tr1./Ts;                                           n2_f2 = tr2./Ts;           % blocklength 
    n1_f2 = (repmat(n1_f2,max(size(tr1)),1))';                     n2_f2 = (repmat(n2_f2,max(size(tr2)),1));
    n1_f2 = repmat(n1_f2,[1 1 length(tr1)]);                      n2_f2 = repmat(n2_f2,[1 1 length(tr2)]);
    C1_f2 = log2(1+gamma1_f2);                                    C2_f2 = log2(1+gamma2_f2);    % Shannon capacity
    V1_f2 = (2*gamma1_f2+gamma1_f2.^2)./(1+gamma1_f2).^2;               V2_f2 = (2*gamma2_f2+gamma2_f2.^2)./(1+gamma2_f2).^2;
    
    error1_f2 = qfunc(sqrt(n1_f2./V1_f2).*(C1_f2-r1_f2).*log(2));          error2_f2 = qfunc(sqrt(n2_f2./V2_f2).*(C2_f2-r2_f2).*log(2));
    Del1_f2 = 0.5*T+T./(1-error1_f2);                             Del2_f2 = 0.5*T+T./(1-error2_f2);
    
    Del_f2 = max(Del1_f2,Del2_f2);
    Del_f2(error1_f2 > 0.1) = NaN;                                Del_f2(error2_f2 > 0.1) = NaN;
    

    mAOI2_t_f2(j) = min(min(min(Del_f2)));
end

%h1 < h2
h1 = h(1,3); h2 = h(2,3);z1 = h1^2;   z2 = h2^2;
for j = 1:length(d_f2)
    E1_f2 = u1*z1*tc1.*Pc/b1;                                  E2_f2 = u2*z2*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f2(i,:,:) = E1_f2./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f2(:,i,:) = (E2_f2./tr2(i));
    end
    gamma1_f2 = Pr1_f2.*z1./(b1*(Pn+h1*Pc));                      gamma2_f2 = Pr2_f2.*z2./(b2*(Pn+h2*Pc));
    
    r1_f2 = d_f2(j)*Ts./tr1;                                      r2_f2 = d_f2(j)*Ts./tr2;         % coding rate
    r1_f2 = (repmat(r1_f2,max(size(tr1)),1))';                     r2_f2 = (repmat(r2_f2,max(size(tr2)),1));
    r1_f2 = repmat(r1_f2,[1 1 length(tr1)]);                      r2_f2 = repmat(r2_f2,[1 1 length(tr2)]);
    n1_f2 = tr1./Ts;                                           n2_f2 = tr2./Ts;           % blocklength 
    n1_f2 = (repmat(n1_f2,max(size(tr1)),1))';                     n2_f2 = (repmat(n2_f2,max(size(tr2)),1));
    n1_f2 = repmat(n1_f2,[1 1 length(tr1)]);                      n2_f2 = repmat(n2_f2,[1 1 length(tr2)]);
    C1_f2 = log2(1+gamma1_f2);                                    C2_f2 = log2(1+gamma2_f2);    % Shannon capacity
    V1_f2 = (2*gamma1_f2+gamma1_f2.^2)./(1+gamma1_f2).^2;               V2_f2 = (2*gamma2_f2+gamma2_f2.^2)./(1+gamma2_f2).^2;
    
    error1_f2 = qfunc(sqrt(n1_f2./V1_f2).*(C1_f2-r1_f2).*log(2));          error2_f2 = qfunc(sqrt(n2_f2./V2_f2).*(C2_f2-r2_f2).*log(2));
    Del1_f2 = 0.5*T+T./(1-error1_f2);                             Del2_f2 = 0.5*T+T./(1-error2_f2);
    Del_f2 = max(Del1_f2,Del2_f2);

    Del1_f2(error1_f2 > 0.1) = NaN;                               Del2_f2(error2_f2 > 0.1) = NaN;
    Del1_f2(error2_f2 > 0.1) = NaN;                               Del2_f2(error1_f2 > 0.1) = NaN;

    mAOI3_t_f2(j) = min(min(min(Del_f2)));
end

%%%%%%%%%%%%%%%%%% error > 0.1 included %%%%%%%%%%%%%%%%%%
         

% h1 = h2
h1 = h(1,1); h2 = h(2,1);z1 = h1^2;   z2 = h2^2;
for j = 1:length(d_f2)
    E1_f2 = u1*z1*tc1.*Pc/b1;                                  E2_f2 = u2*z2*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f2(i,:,:) = E1_f2./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f2(:,i,:) = (E2_f2./tr2(i));
    end
    gamma1_f2 = Pr1_f2.*z1./(b1*(Pn+h1*Pc));                      gamma2_f2 = Pr2_f2.*z2./(b2*(Pn+h2*Pc));
    
    r1_f2 = d_f2(j)*Ts./tr1;                                      r2_f2 = d_f2(j)*Ts./tr2;         % coding rate
    r1_f2 = (repmat(r1_f2,max(size(tr1)),1))';                     r2_f2 = (repmat(r2_f2,max(size(tr2)),1));
    r1_f2 = repmat(r1_f2,[1 1 length(tr1)]);                      r2_f2 = repmat(r2_f2,[1 1 length(tr2)]);
    n1_f2 = tr1./Ts;                                           n2_f2 = tr2./Ts;           % blocklength 
    n1_f2 = (repmat(n1_f2,max(size(tr1)),1))';                     n2_f2 = (repmat(n2_f2,max(size(tr2)),1));
    n1_f2 = repmat(n1_f2,[1 1 length(tr1)]);                      n2_f2 = repmat(n2_f2,[1 1 length(tr2)]);
    C1_f2 = log2(1+gamma1_f2);                                    C2_f2 = log2(1+gamma2_f2);    % Shannon capacity
    V1_f2 = (2*gamma1_f2+gamma1_f2.^2)./(1+gamma1_f2).^2;               V2_f2 = (2*gamma2_f2+gamma2_f2.^2)./(1+gamma2_f2).^2;
    
    error1_f2 = qfunc(sqrt(n1_f2./V1_f2).*(C1_f2-r1_f2).*log(2));          error2_f2 = qfunc(sqrt(n2_f2./V2_f2).*(C2_f2-r2_f2).*log(2));
    Del1_f2 = 0.5*T+T./(1-error1_f2);                             Del2_f2 = 0.5*T+T./(1-error2_f2);
    Del_f2 = max(Del1_f2,Del2_f2);

    mAOI1_f2(j) = min(min(min(Del_f2)));
end
mAOI1_f2(mAOI1_f2 > 10000) = NaN;
% h1 > h2
h1 = h(1,2); h2 = h(2,2);z1 = h1^2;   z2 = h2^2;
for j = 1:length(d_f2)
    E1_f2 = u1*z1*tc1.*Pc/b1;                                  E2_f2 = u2*z2*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f2(i,:,:) = E1_f2./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f2(:,i,:) = (E2_f2./tr2(i));
    end
    gamma1_f2 = Pr1_f2.*z1./(b1*(Pn+h1*Pc));                      gamma2_f2 = Pr2_f2.*z2./(b2*(Pn+h2*Pc));
    
    r1_f2 = d_f2(j)*Ts./tr1;                                      r2_f2 = d_f2(j)*Ts./tr2;         % coding rate
    r1_f2 = (repmat(r1_f2,max(size(tr1)),1))';                     r2_f2 = (repmat(r2_f2,max(size(tr2)),1));
    r1_f2 = repmat(r1_f2,[1 1 length(tr1)]);                      r2_f2 = repmat(r2_f2,[1 1 length(tr2)]);
    n1_f2 = tr1./Ts;                                           n2_f2 = tr2./Ts;           % blocklength 
    n1_f2 = (repmat(n1_f2,max(size(tr1)),1))';                     n2_f2 = (repmat(n2_f2,max(size(tr2)),1));
    n1_f2 = repmat(n1_f2,[1 1 length(tr1)]);                      n2_f2 = repmat(n2_f2,[1 1 length(tr2)]);
    C1_f2 = log2(1+gamma1_f2);                                    C2_f2 = log2(1+gamma2_f2);    % Shannon capacity
    V1_f2 = (2*gamma1_f2+gamma1_f2.^2)./(1+gamma1_f2).^2;               V2_f2 = (2*gamma2_f2+gamma2_f2.^2)./(1+gamma2_f2).^2;
    
    error1_f2 = qfunc(sqrt(n1_f2./V1_f2).*(C1_f2-r1_f2).*log(2));          error2_f2 = qfunc(sqrt(n2_f2./V2_f2).*(C2_f2-r2_f2).*log(2));
    Del1_f2 = 0.5*T+T./(1-error1_f2);                             Del2_f2 = 0.5*T+T./(1-error2_f2);
    Del_f2 = max(Del1_f2,Del2_f2);

    mAOI2_f2(j) = min(min(min(Del_f2)));
end
mAOI2_f2(mAOI2_f2 > 10000) = NaN;


% h1 < h2
h1 = h(1,3); h2 = h(2,3);z1 = h1^2;   z2 = h2^2;
for j = 1:length(d_f2)
    E1_f2 = u1*z1*tc1.*Pc/b1;                                  E2_f2 = u2*z2*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f2(i,:,:) = E1_f2./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f2(:,i,:) = (E2_f2./tr2(i));
    end
    gamma1_f2 = Pr1_f2.*z1./(b1*(Pn+h1*Pc));                      gamma2_f2 = Pr2_f2.*z2./(b2*(Pn+h2*Pc));
    
    r1_f2 = d_f2(j)*Ts./tr1;                                      r2_f2 = d_f2(j)*Ts./tr2;         % coding rate
    r1_f2 = (repmat(r1_f2,max(size(tr1)),1))';                     r2_f2 = (repmat(r2_f2,max(size(tr2)),1));
    r1_f2 = repmat(r1_f2,[1 1 length(tr1)]);                      r2_f2 = repmat(r2_f2,[1 1 length(tr2)]);
    n1_f2 = tr1./Ts;                                           n2_f2 = tr2./Ts;           % blocklength 
    n1_f2 = (repmat(n1_f2,max(size(tr1)),1))';                     n2_f2 = (repmat(n2_f2,max(size(tr2)),1));
    n1_f2 = repmat(n1_f2,[1 1 length(tr1)]);                      n2_f2 = repmat(n2_f2,[1 1 length(tr2)]);
    C1_f2 = log2(1+gamma1_f2);                                    C2_f2 = log2(1+gamma2_f2);    % Shannon capacity
    V1_f2 = (2*gamma1_f2+gamma1_f2.^2)./(1+gamma1_f2).^2;               V2_f2 = (2*gamma2_f2+gamma2_f2.^2)./(1+gamma2_f2).^2;
    
    error1_f2 = qfunc(sqrt(n1_f2./V1_f2).*(C1_f2-r1_f2).*log(2));          error2_f2 = qfunc(sqrt(n2_f2./V2_f2).*(C2_f2-r2_f2).*log(2));
    Del1_f2 = 0.5*T+T./(1-error1_f2);                             Del2_f2 = 0.5*T+T./(1-error2_f2);    
    Del_f2 = max(Del1_f2,Del2_f2);

    mAOI3_f2(j) = min(min(min(Del_f2)));
end
mAOI3_f2(mAOI3_f2 > 10000) = NaN;

