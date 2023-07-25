for i = 1:max(size(tr1))
    T_f6(i,:) = tc+tr1(i)+tr2;
end
TT_f6 = T_f6;
for i = 1:length(tc)
    T_f6(:,:,i) = TT_f6+tc(i);
end
tc1_f6 = T_f6(1,:,:);                                           tc2_f6 = T_f6(:,1,:);           


for i = 1:length(D1_f6)
    D2_f6 = D1_f6(i);
    b1_f6 = D1_f6(i)^2.7;             b2_f6 = D2_f6^2.7;
    
    E1_f6 = u1*z1*tc1_f6.*Pc/b1_f6;                                  E2_f6 = u2*z2*tc2_f6.*Pc/b2_f6;      %b1、b2是论文中D^2.7  
    for j = 1:max(size(tr1))
     Pr1_f6(j,:,:) = E1_f6./tr1(j);
    end
    for j = 1:max(size(tr2))
     Pr2_f6(:,j,:) = E2_f6./tr2(j);
    end
    gamma1_f6 = Pr1_f6.*z1./(b1_f6*(Pn+h1*Pc));                      gamma2_f6 = Pr2_f6.*z2./(b2_f6*(Pn+h2*Pc));
    
    r1_f6 = d*Ts./tr1;                                            r2_f6 = d*Ts./tr2;         % coding rate
    r1_f6 = (repmat(r1_f6,max(size(tr1)),1))';                    r2_f6 = (repmat(r2_f6,max(size(tr2)),1));
    r1_f6 = repmat(r1_f6,[1 1 length(tr1)]);                      r2_f6 = repmat(r2_f6,[1 1 length(tr2)]);
    n1_f6 = tr1./Ts;                                              n2_f6 = tr2./Ts;           % blocklength 
    n1_f6 = (repmat(n1_f6,max(size(tr1)),1))';                    n2_f6 = (repmat(n2_f6,max(size(tr2)),1));
    n1_f6 = repmat(n1_f6,[1 1 length(tr1)]);                      n2_f6 = repmat(n2_f6,[1 1 length(tr2)]);
    C1_f6 = log2(1+gamma1_f6);                                    C2_f6 = log2(1+gamma2_f6);    % Shannon capacity
    V1_f6 = (2*gamma1_f6+gamma1_f6.^2)./(1+gamma1_f6).^2;         V2_f6 = (2*gamma2_f6+gamma2_f6.^2)./(1+gamma2_f6).^2;
    
    error1_f6 = qfunc(sqrt(n1_f6./V1_f6).*(C1_f6-r1_f6).*log(2)); error2_f6 = qfunc(sqrt(n2_f6./V2_f6).*(C2_f6-r2_f6).*log(2));
    Del1_f6 = 0.5*T_f6+T_f6./(1-error1_f6);                       Del2_f6 = 0.5*T_f6+T_f6./(1-error2_f6);
    Del_f6 = max(Del1_f6,Del2_f6);
    Del_f6(error1_f6 > 0.1) = NaN;                                Del_f6(error2_f6 > 0.1) = NaN;
    
    
    position_AOI_f6 = find(Del_f6 == min(min(min(Del_f6))));                  % 找该AOI的页数，即为tc的索引值
    minAOI_f6(i) = min(min(min(Del_f6)));
    [x,y,z] = ind2sub(size(Del_f6),position_AOI_f6);                % z为tc索引值
    if isempty(z)
        TC(i) = NaN;
    else
        TC(i) = tc(z);
    end
end