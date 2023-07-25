for i = 1:max(size(tr1))
    T_f5(i,:) = tc+tr1(i)+tr2;
end
TT_f5 = T_f5;
for i = 1:length(tc)
    T_f5(:,:,i) = TT_f5+tc(i);
end
tc1_f5 = T_f5(1,:,:);                                           tc2_f5 = T_f5(:,1,:);           
 
h2_f5 = 4;    z2_f5 = h2_f5^2;
for j = 1:length(h1_f5)
    z1_f5 = h1_f5(j)^2;
    E1_f5 = u1*z1_f5*tc1_f5.*Pc/b1;                             E2_f5 = u2*z2_f5*tc2_f5.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
        Pr1_f5(i,:,:) = E1_f5./tr1(i);
    end
    for i = 1:max(size(tr2))
        Pr2_f5(:,i,:) = E2_f5./tr2(i);
    end
    gamma1_f5 = Pr1_f5.*z1_f5./(b1*(Pn+h1_f5(j)*Pc));                   gamma2_f5 = Pr2_f5.*z2_f5./(b2*(Pn+h2_f5*Pc));
    
    r1_f5 = d*Ts./tr1;                                            r2_f5 = d*Ts./tr2;         % coding rate
    r1_f5 = (repmat(r1_f5,max(size(tr1)),1))';                    r2_f5 = (repmat(r2_f5,max(size(tr2)),1));
    r1_f5 = repmat(r1_f5,[1 1 length(tr1)]);                      r2_f5 = repmat(r2_f5,[1 1 length(tr2)]);
    n1_f5 = tr1./Ts;                                              n2_f5 = tr2./Ts;           % blocklength 
    n1_f5 = (repmat(n1_f5,max(size(tr1)),1))';                    n2_f5 = (repmat(n2_f5,max(size(tr2)),1));
    n1_f5 = repmat(n1_f5,[1 1 length(tr1)]);                      n2_f5 = repmat(n2_f5,[1 1 length(tr2)]);
    C1_f5 = log2(1+gamma1_f5);                                    C2_f5 = log2(1+gamma2_f5);    % Shannon capacity
    V1_f5 = (2*gamma1_f5+gamma1_f5.^2)./(1+gamma1_f5).^2;         V2_f5 = (2*gamma2_f5+gamma2_f5.^2)./(1+gamma2_f5).^2;
    
    error1_f5 = qfunc(sqrt(n1_f5./V1_f5).*(C1_f5-r1_f5).*log(2));          error2_f5 = qfunc(sqrt(n2_f5./V2_f5).*(C2_f5-r2_f5).*log(2));

    Del1_f5 = 0.5*T_f5+T_f5./(1-error1_f5);                             Del2_f5 = 0.5*T_f5+T_f5./(1-error2_f5);

    A_f5 = max(Del1_f5,Del2_f5);
    error_f5 = max(error1_f5,error2_f5);

    p_mAOI_f5 = find(A_f5 == min(min(min(A_f5))));       % 最小AOI的位置
    minAOI1_f5(j) = min(min(min(A_f5)));               % 最小AOI                      图1
    for k = 1:length(p_mAOI_f5)
        maxerror_f5(k) = error_f5(p_mAOI_f5(k));         % 最小AOI对应的error
    end
    MAXerror1_f5(j) = max(maxerror_f5);                % 最小AOI对应的最大error       图1
    maxerror_f5 = [];
    p_error_f5 = find(error_f5 == min(min(min(error_f5))));  % 最小error的位置
    minerror1_f5(j) = min(min(min(error_f5)));            % 最小error                 图2
    for k = 1:length(p_error_f5)
        maxAOI1_f5(k) = A_f5(p_error_f5(k));             % 最小error对应的AOI
    end
    MAXAOI1_f5(j) = max(maxAOI1_f5);                  % 最小error对应的最大AOI       图2
    maxAOI1_f5 = [];
end

h2_f5 = 8;    z2_f5 = h2_f5^2;
for j = 1:length(h1_f5)
    z1_f5 = h1_f5(j)^2;
    E1_f5 = u1*z1_f5*tc1_f5.*Pc/b1;                                  E2_f5 = u2*z2_f5*tc2_f5.*Pc/b2;      %b1、b2是论文中D^2.7  
    for i = 1:max(size(tr1))
     Pr1_f5(i,:,:) = E1_f5./tr1(i);
    end
    for i = 1:max(size(tr2))
     Pr2_f5(:,i,:) = E2_f5./tr2(i);
    end
    gamma1_f5 = Pr1_f5.*z1_f5./(b1*(Pn+h1_f5(j)*Pc));                   gamma2_f5 = Pr2_f5.*z2_f5./(b2*(Pn+h2_f5*Pc));
    
    r1_f5 = d*Ts./tr1;                                         r2_f5 = d*Ts./tr2;         % coding rate
    r1_f5 = (repmat(r1_f5,max(size(tr1)),1))';                    r2_f5 = (repmat(r2_f5,max(size(tr2)),1));
    r1_f5 = repmat(r1_f5,[1 1 length(tr1)]);                      r2_f5 = repmat(r2_f5,[1 1 length(tr2)]);
    n1_f5 = tr1./Ts;                                           n2_f5 = tr2./Ts;           % blocklength 
    n1_f5 = (repmat(n1_f5,max(size(tr1)),1))';                    n2_f5 = (repmat(n2_f5,max(size(tr2)),1));
    n1_f5 = repmat(n1_f5,[1 1 length(tr1)]);                      n2_f5 = repmat(n2_f5,[1 1 length(tr2)]);
    C1_f5 = log2(1+gamma1_f5);                                    C2_f5 = log2(1+gamma2_f5);    % Shannon capacity
    V1_f5 = (2*gamma1_f5+gamma1_f5.^2)./(1+gamma1_f5).^2;               V2_f5 = (2*gamma2_f5+gamma2_f5.^2)./(1+gamma2_f5).^2;
    
    error1_f5 = qfunc(sqrt(n1_f5./V1_f5).*(C1_f5-r1_f5).*log(2));          error2_f5 = qfunc(sqrt(n2_f5./V2_f5).*(C2_f5-r2_f5).*log(2));
    
    Del1_f5 = 0.5*T_f5+T_f5./(1-error1_f5);                             Del2_f5 = 0.5*T_f5+T_f5./(1-error2_f5);

    A_f5 = max(Del1_f5,Del2_f5);
    error_f5 = max(error1_f5,error2_f5);

    p_mAOI_f5 = find(A_f5 == min(min(min(A_f5))));           % 最小AOI的位置
    minAOI3_f5(j) = min(min(min(A_f5)));                  % 最小AOI        图1
    for k = 1:length(p_mAOI_f5)
        maxerror_f5(k) = error_f5(p_mAOI_f5(k));
    end
    MAXerror3_f5(j) = max(maxerror_f5);                    % 对应的最大error 图1
    maxerror_f5 = [];
    p_error_f5 = find(error_f5 == min(min(min(error_f5)))); % 最小error的位置
    minerror3_f5(j) = min(min(min(error_f5)));            % 最小error       图2
    for k = 1:length(p_error_f5)
        maxAOI3_f5(k) = A_f5(p_error_f5(k));
    end
    MAXAOI3_f5(j) = max(maxAOI3_f5);                      % 对应的最大AOI   图2
    maxAOI3_f5 = [];
end

