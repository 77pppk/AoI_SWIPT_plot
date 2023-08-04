clear;

c = 3*10^8; f_c = 2.4*10^6; a = 0.5;

d1 = 23.7;   d2 = d1;               % 21.7403898
PL1 = c/(4*pi*f_c*d1)*exp(-a*d1/2); PL2 = c/(4*pi*f_c*d2)*exp(-a*d2/2);
b1 = 1/(PL1); b2 = 1/(PL2); b3 = b1; b4 = b1; b5 = b1;


Pn =  0.01;     % noise power
Ts = 0.000025;        % 改distance相当于改h   
Pc = 1; D = 300; % packet size
h1 = 8;   h2 = h1;    z1 = h1^2;   z2 = h2^2;    % h is used as power gain
u1 = 0.3; u2 = u1;
h3 = h1; h4 = h1; h5 = h1; z3 = z1; z4 = z1; z5 = z1;
u3 = u1; u4 = u1; u5 = u1;

tc = [0:0.05:20]; 
tr1 = [0:0.05:20];



F = 1;      n = 5;
for i = 1:length(tr1)
    for j = 1:length(tc)
        tr1_t = tr1(i); tr2_t = tr1_t; tr3_t = tr1_t; tr4_t = tr1_t; tr5_t = tr1_t;
        tc_t = tc(j);
         
        T_t = tr2_t + tr1_t + tr5_t + tr4_t + tr3_t + tc_t;
        tc1 = T_t-tr1_t;  tc2 = T_t-tr2_t;  tc3 = T_t-tr3_t;  tc4 = T_t-tr4_t;  tc5 = T_t-tr5_t;           
        
        E1 = u1*z1*tc1.*Pc/b1;                                  
        E2 = u2*z2*tc2.*Pc/b2;      
        E3 = u3*z3*tc3.*Pc/b3;
        E4 = u4*z4*tc4.*Pc/b4;
        E5 = u5*z5*tc5.*Pc/b5;

        Pr1 = E1./tr1_t;                                        
        Pr2 = E2./tr2_t;
        Pr3 = E3./tr3_t;
        Pr4 = E4./tr4_t;
        Pr5 = E5./tr5_t;
        
        gamma1 = Pr1.*z1./(b1*(Pn+h1*Pc));                      
        gamma2 = Pr2.*z2./(b2*(Pn+h2*Pc));
        gamma3 = Pr3.*z2./(b3*(Pn+h3*Pc));
        gamma4 = Pr4.*z2./(b4*(Pn+h4*Pc));
        gamma5 = Pr5.*z2./(b5*(Pn+h5*Pc));
        
        r1 = D*Ts./tr1_t;                                       
        r2 = D*Ts./tr2_t;         % coding rate
        r3 = D*Ts./tr3_t;
        r4 = D*Ts./tr4_t;
        r5 = D*Ts./tr5_t;

        n1 = tr1_t./Ts;                                         
        n2 = tr2_t./Ts;           % blocklength 
        n3 = tr3_t./Ts; 
        n4 = tr4_t./Ts; 
        n5 = tr5_t./Ts; 

        C1 = log2(1+gamma1);                                    
        C2 = log2(1+gamma2);    % Shannon capacity
        C3 = log2(1+gamma3);
        C4 = log2(1+gamma4);
        C5 = log2(1+gamma5);


        V1 = (2*gamma1+gamma1.^2)./(1+gamma1).^2;               
        V2 = (2*gamma2+gamma2.^2)./(1+gamma2).^2;  
        V3 = (2*gamma3+gamma3.^2)./(1+gamma3).^2;
        V4 = (2*gamma4+gamma4.^2)./(1+gamma4).^2;
        V5 = (2*gamma5+gamma5.^2)./(1+gamma5).^2;

        error1 = qfunc(sqrt(n1./V1).*(C1-r1).*log(2));          
        error2 = qfunc(sqrt(n2./V2).*(C2-r2).*log(2));
        error3 = qfunc(sqrt(n3./V3).*(C3-r3).*log(2));
        error4 = qfunc(sqrt(n4./V4).*(C4-r4).*log(2));
        error5 = qfunc(sqrt(n5./V5).*(C5-r5).*log(2));

        error = max(error1,error2);
        error = max(error,error3);
        error = max(error,error4);
        error = max(error,error5);

        AoI(i,j) = 0.5*T_t+1/F*((T_t+F/(1-error))/n)^2;
%         if isnan(AoI(i,j))
%             F = 1;
%         else
%             F = -((1-error)^2*(2*T_t/(1-error)+2*T_t-4*AoI(i,j)))/2;
%         end
    end
end

AoI(AoI > 100) = NaN;
p3 = surf(tr1,tc,AoI);set(gca,'ZScale','log');shading interp;hold on;
xlabel('tr1');ylabel('tc');zlabel('max');title('h1 = h2');