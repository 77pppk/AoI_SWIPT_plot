h1_f4 = [0:1:10]; 

%%%%%%%%%%%%%%
h2_f4 = 6;   z2_f4 = h2_f4^2;
u1_f4 = 0.3; u2_f4 = u1_f4;  
for j = 1:length(h1_f4)
    z1_f4 = h1_f4(j)^2;
    E1_f4 = u1_f4*z1_f4*tc1.*Pc/b1;                                  E2_f4 = u2_f4*z2_f4*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f4(i,:,:) = E1_f4./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f4(:,i,:) = E2_f4./tr2(i);
    end
    gamma1_f4 = Pr1_f4.*z1_f4./(b1*(Pn+h1_f4(j)*Pc));                   gamma2_f4 = Pr2_f4.*z2_f4./(b2*(Pn+h2_f4*Pc));
    
    r1_f4 = d*Ts./tr1;                                            r2_f4 = d*Ts./tr2;         % coding rate
    r1_f4 = (repmat(r1_f4,max(size(tr1)),1))';                    r2_f4 = (repmat(r2_f4,max(size(tr2)),1));
    r1_f4 = repmat(r1_f4,[1 1 length(tr1)]);                      r2_f4 = repmat(r2_f4,[1 1 length(tr2)]);    
    n1_f4 = tr1./Ts;                                              n2_f4 = tr2./Ts;           % blocklength 
    n1_f4 = (repmat(n1_f4,max(size(tr1)),1))';                    n2_f4 = (repmat(n2_f4,max(size(tr2)),1));
    n1_f4 = repmat(n1_f4,[1 1 length(tr1)]);                      n2_f4 = repmat(n2_f4,[1 1 length(tr2)]);
    C1_f4 = log2(1+gamma1_f4);                                    C2_f4 = log2(1+gamma2_f4);    % Shannon capacity
    V1_f4 = (2*gamma1_f4+gamma1_f4.^2)./(1+gamma1_f4).^2;         V2_f4 = (2*gamma2_f4+gamma2_f4.^2)./(1+gamma2_f4).^2;
    
    error1_f4 = qfunc(sqrt(n1_f4./V1_f4).*(C1_f4-r1_f4).*log(2));          error2_f4 = qfunc(sqrt(n2_f4./V2_f4).*(C2_f4-r2_f4).*log(2));

    Del1_f4 = 0.5*T+T./(1-error1_f4);                             Del2_f4 = 0.5*T+T./(1-error2_f4);
    Del_f4 = max(Del1_f4,Del2_f4);
    Del_f4(error1_f4 > 0.1) = NaN;                                Del_f4(error2_f4 > 0.1) = NaN;
    

    mAOI1_f4(j) = min(min(min(Del_f4)));
end

h2_f4 = 8;   z2_f4 = h2_f4^2;
u1_f4 = 0.3; u2_f4 = u1_f4;  
for j = 1:length(h1_f4)
    z1_f4 = h1_f4(j)^2;
    E1_f4 = u1_f4*z1_f4*tc1.*Pc/b1;                                  E2_f4 = u2_f4*z2_f4*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f4(i,:,:) = E1_f4./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f4(:,i,:) = E2_f4./tr2(i);
    end
    gamma1_f4 = Pr1_f4.*z1_f4./(b1*(Pn+h1_f4(j)*Pc));                   gamma2_f4 = Pr2_f4.*z2_f4./(b2*(Pn+h2_f4*Pc));
    
    r1_f4 = d*Ts./tr1;                                         r2_f4 = d*Ts./tr2;         % coding rate
    r1_f4 = (repmat(r1_f4,max(size(tr1)),1))';                    r2_f4 = (repmat(r2_f4,max(size(tr2)),1));
    r1_f4 = repmat(r1_f4,[1 1 length(tr1)]);                      r2_f4 = repmat(r2_f4,[1 1 length(tr2)]);
    n1_f4 = tr1./Ts;                                           n2_f4 = tr2./Ts;           % blocklength 
    n1_f4 = (repmat(n1_f4,max(size(tr1)),1))';                    n2_f4 = (repmat(n2_f4,max(size(tr2)),1));
    n1_f4 = repmat(n1_f4,[1 1 length(tr1)]);                      n2_f4 = repmat(n2_f4,[1 1 length(tr2)]);
    C1_f4 = log2(1+gamma1_f4);                                    C2_f4 = log2(1+gamma2_f4);    % Shannon capacity
    V1_f4 = (2*gamma1_f4+gamma1_f4.^2)./(1+gamma1_f4).^2;               V2_f4 = (2*gamma2_f4+gamma2_f4.^2)./(1+gamma2_f4).^2;
    
    error1_f4 = qfunc(sqrt(n1_f4./V1_f4).*(C1_f4-r1_f4).*log(2));          error2_f4 = qfunc(sqrt(n2_f4./V2_f4).*(C2_f4-r2_f4).*log(2));

    Del1_f4 = 0.5*T+T./(1-error1_f4);                             Del2_f4 = 0.5*T+T./(1-error2_f4);
    Del_f4 = max(Del1_f4,Del2_f4);
    Del_f4(error1_f4 > 0.1) = NaN;                                Del_f4(error2_f4 > 0.1) = NaN;
    

    mAOI2_f4(j) = min(min(min(Del_f4)));
end

%%%%%%%%%%%%%%%
h2_f4 = 6;    z2_f4 = h2_f4^2;
u1_f4 = 0.6;  u2_f4 = u1_f4;  
for j = 1:length(h1_f4)
    z1_f4 = h1_f4(j)^2;
    E1_f4 = u1_f4*z1_f4*tc1.*Pc/b1;                                  E2_f4 = u2_f4*z2_f4*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f4(i,:,:) = E1_f4./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f4(:,i,:) = E2_f4./tr2(i);
    end
    gamma1_f4 = Pr1_f4.*z1_f4./(b1*(Pn+h1_f4(j)*Pc));                   gamma2_f4 = Pr2_f4.*z2_f4./(b2*(Pn+h2_f4*Pc));
    
    r1_f4 = d*Ts./tr1;                                         r2_f4 = d*Ts./tr2;         % coding rate
    r1_f4 = (repmat(r1_f4,max(size(tr1)),1))';                    r2_f4 = (repmat(r2_f4,max(size(tr2)),1));
    r1_f4 = repmat(r1_f4,[1 1 length(tr1)]);                      r2_f4 = repmat(r2_f4,[1 1 length(tr2)]);
    n1_f4 = tr1./Ts;                                           n2_f4 = tr2./Ts;           % blocklength 
    n1_f4 = (repmat(n1_f4,max(size(tr1)),1))';                    n2_f4 = (repmat(n2_f4,max(size(tr2)),1));
    n1_f4 = repmat(n1_f4,[1 1 length(tr1)]);                      n2_f4 = repmat(n2_f4,[1 1 length(tr2)]);
    C1_f4 = log2(1+gamma1_f4);                                    C2_f4 = log2(1+gamma2_f4);    % Shannon capacity
    V1_f4 = (2*gamma1_f4+gamma1_f4.^2)./(1+gamma1_f4).^2;               V2_f4 = (2*gamma2_f4+gamma2_f4.^2)./(1+gamma2_f4).^2;
    
    error1_f4 = qfunc(sqrt(n1_f4./V1_f4).*(C1_f4-r1_f4).*log(2));          error2_f4 = qfunc(sqrt(n2_f4./V2_f4).*(C2_f4-r2_f4).*log(2)); 
    Del1_f4 = 0.5*T+T./(1-error1_f4);                             Del2_f4 = 0.5*T+T./(1-error2_f4);
    Del_f4 = max(Del1_f4,Del2_f4);
    Del_f4(error1_f4 > 0.1) = NaN;                                Del_f4(error2_f4 > 0.1) = NaN;
    

    mAOI3_f4(j) = min(min(min(Del_f4)));
end

h2_f4 = 8;    z2_f4 = h2_f4^2;
u1_f4 = 0.6;  u2_f4 = u1_f4;  
for j = 1:length(h1_f4)
    z1_f4 = h1_f4(j)^2;
    E1_f4 = u1_f4*z1_f4*tc1.*Pc/b1;                                  E2_f4 = u2_f4*z2_f4*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f4(i,:,:) = E1_f4./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f4(:,i,:) = E2_f4./tr2(i);
    end
    gamma1_f4 = Pr1_f4.*z1_f4./(b1*(Pn+h1_f4(j)*Pc));                   gamma2_f4 = Pr2_f4.*z2_f4./(b2*(Pn+h2_f4*Pc));
    
    r1_f4 = d*Ts./tr1;                                         r2_f4 = d*Ts./tr2;         % coding rate
    r1_f4 = (repmat(r1_f4,max(size(tr1)),1))';                    r2_f4 = (repmat(r2_f4,max(size(tr2)),1));
    r1_f4 = repmat(r1_f4,[1 1 length(tr1)]);                      r2_f4 = repmat(r2_f4,[1 1 length(tr2)]);
    n1_f4 = tr1./Ts;                                           n2_f4 = tr2./Ts;           % blocklength 
    n1_f4 = (repmat(n1_f4,max(size(tr1)),1))';                    n2_f4 = (repmat(n2_f4,max(size(tr2)),1));
    n1_f4 = repmat(n1_f4,[1 1 length(tr1)]);                      n2_f4 = repmat(n2_f4,[1 1 length(tr2)]);
    C1_f4 = log2(1+gamma1_f4);                                    C2_f4 = log2(1+gamma2_f4);    % Shannon capacity
    V1_f4 = (2*gamma1_f4+gamma1_f4.^2)./(1+gamma1_f4).^2;               V2_f4 = (2*gamma2_f4+gamma2_f4.^2)./(1+gamma2_f4).^2;
    
    error1_f4 = qfunc(sqrt(n1_f4./V1_f4).*(C1_f4-r1_f4).*log(2));          error2_f4 = qfunc(sqrt(n2_f4./V2_f4).*(C2_f4-r2_f4).*log(2)); 
    Del1_f4 = 0.5*T+T./(1-error1_f4);                             Del2_f4 = 0.5*T+T./(1-error2_f4);
    Del_f4 = max(Del1_f4,Del2_f4);
    Del_f4(error1_f4 > 0.1) = NaN;                                Del_f4(error2_f4 > 0.1) = NaN;
    

    mAOI4_f4(j) = min(min(min(Del_f4)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%
h2_f4 = 6;    z2_f4 = h2_f4^2;
u1_f4 = 0.8;  u2_f4 = u1_f4;  
for j = 1:length(h1_f4)
    z1_f4 = h1_f4(j)^2;
    E1_f4 = u1_f4*z1_f4*tc1.*Pc/b1;                                  E2_f4 = u2_f4*z2_f4*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f4(i,:,:) = E1_f4./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f4(:,i,:) = E2_f4./tr2(i);
    end
    gamma1_f4 = Pr1_f4.*z1_f4./(b1*(Pn+h1_f4(j)*Pc));                   gamma2_f4 = Pr2_f4.*z2_f4./(b2*(Pn+h2_f4*Pc));
    
    r1_f4 = d*Ts./tr1;                                         r2_f4 = d*Ts./tr2;         % coding rate
    r1_f4 = (repmat(r1_f4,max(size(tr1)),1))';                    r2_f4 = (repmat(r2_f4,max(size(tr2)),1));
    r1_f4 = repmat(r1_f4,[1 1 length(tr1)]);                      r2_f4 = repmat(r2_f4,[1 1 length(tr2)]);
    n1_f4 = tr1./Ts;                                           n2_f4 = tr2./Ts;           % blocklength 
    n1_f4 = (repmat(n1_f4,max(size(tr1)),1))';                    n2_f4 = (repmat(n2_f4,max(size(tr2)),1));
    n1_f4 = repmat(n1_f4,[1 1 length(tr1)]);                      n2_f4 = repmat(n2_f4,[1 1 length(tr2)]);
    C1_f4 = log2(1+gamma1_f4);                                    C2_f4 = log2(1+gamma2_f4);    % Shannon capacity
    V1_f4 = (2*gamma1_f4+gamma1_f4.^2)./(1+gamma1_f4).^2;               V2_f4 = (2*gamma2_f4+gamma2_f4.^2)./(1+gamma2_f4).^2;
    
    error1_f4 = qfunc(sqrt(n1_f4./V1_f4).*(C1_f4-r1_f4).*log(2));          error2_f4 = qfunc(sqrt(n2_f4./V2_f4).*(C2_f4-r2_f4).*log(2)); 
    Del1_f4 = 0.5*T+T./(1-error1_f4);                             Del2_f4 = 0.5*T+T./(1-error2_f4);
    Del_f4 = max(Del1_f4,Del2_f4);
    Del_f4(error1_f4 > 0.1) = NaN;                                Del_f4(error2_f4 > 0.1) = NaN;
    
    mAOI5_f4(j) = min(min(min(Del_f4)));
end

h2_f4 = 8;    z2_f4 = h2_f4^2;
u1_f4 = 0.8;  u2_f4 = u1_f4;  
for j = 1:length(h1_f4)
    z1_f4 = h1_f4(j)^2;
    E1_f4 = u1_f4*z1_f4*tc1.*Pc/b1;                                  E2_f4 = u2_f4*z2_f4*tc2.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f4(i,:,:) = E1_f4./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f4(:,i,:) = E2_f4./tr2(i);
    end
    gamma1_f4 = Pr1_f4.*z1_f4./(b1*(Pn+h1_f4(j)*Pc));                   gamma2_f4 = Pr2_f4.*z2_f4./(b2*(Pn+h2_f4*Pc));
    
    r1_f4 = d*Ts./tr1;                                         r2_f4 = d*Ts./tr2;         % coding rate
    r1_f4 = (repmat(r1_f4,max(size(tr1)),1))';                    r2_f4 = (repmat(r2_f4,max(size(tr2)),1));
    r1_f4 = repmat(r1_f4,[1 1 length(tr1)]);                      r2_f4 = repmat(r2_f4,[1 1 length(tr2)]);
    n1_f4 = tr1./Ts;                                           n2_f4 = tr2./Ts;           % blocklength 
    n1_f4 = (repmat(n1_f4,max(size(tr1)),1))';                    n2_f4 = (repmat(n2_f4,max(size(tr2)),1));
    n1_f4 = repmat(n1_f4,[1 1 length(tr1)]);                      n2_f4 = repmat(n2_f4,[1 1 length(tr2)]);
    C1_f4 = log2(1+gamma1_f4);                                    C2_f4 = log2(1+gamma2_f4);    % Shannon capacity
    V1_f4 = (2*gamma1_f4+gamma1_f4.^2)./(1+gamma1_f4).^2;               V2_f4 = (2*gamma2_f4+gamma2_f4.^2)./(1+gamma2_f4).^2;
    
    error1_f4 = qfunc(sqrt(n1_f4./V1_f4).*(C1_f4-r1_f4).*log(2));          error2_f4 = qfunc(sqrt(n2_f4./V2_f4).*(C2_f4-r2_f4).*log(2)); 
    Del1_f4 = 0.5*T+T./(1-error1_f4);                             Del2_f4 = 0.5*T+T./(1-error2_f4);
    Del_f4 = max(Del1_f4,Del2_f4);
    Del_f4(error1_f4 > 0.1) = NaN;                                Del_f4(error2_f4 > 0.1) = NaN;
    

    mAOI6_f4(j) = min(min(min(Del_f4)));
end
