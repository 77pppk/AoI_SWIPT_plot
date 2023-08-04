figure(1);       
p3 = surf(tr1_f1,tr2_f1,Del_f1);set(gca,'ZScale','log');shading interp;alpha(.5);hold on;
Del_f1(error1_f1 > 0.1) = NaN;                                  Del_f1(error2_f1 > 0.1) = NaN;
Del_f1(isinf(Del_f1)) = NaN;
p3 = surf(tr1_f1,tr2_f1,Del_f1);set(gca,'ZScale','log');shading interp;
xlabel('tr2');ylabel('tr1');zlabel('max');title('h1 = h2');


figure(2);
subplot(3,1,1);
plot(D_f2,mAOI1_t_f2,'*');hold on;
plot(D_f2,mAOI1_f2);
xlabel('D');ylabel('max AOI*');
legend('with threshold','without');title('h1 = h2 = 8');
subplot(3,1,2);
plot(D_f2,mAOI2_t_f2,'*');hold on;
plot(D_f2,mAOI2_f2);
xlabel('D');ylabel('max AOI*');
legend('with threshold','without');title('h1(8) > h2(7)');
subplot(3,1,3);
plot(D_f2,mAOI3_t_f2,'*');hold on;
plot(D_f2,mAOI3_f2);
legend('with threshold','without');title('h1(8) > h2(6)');


figure(3);
xlabel('dt');ylabel('maxAOI')
plot(dt,A1_f3);hold on;
plot(dt,A2_f3);hold on;
plot(dt,A3_f3);
legend('tc=dt','tr1=tr1+dt','tr2=tr2+dt');
xlabel('dt');ylabel('AoI');


figure(4);
plot(h1_f4,mAOI1_f4);hold on;
xlabel('h1');ylabel('max AOI*');
plot(h1_f4,mAOI2_f4);hold on;
xlabel('h1');ylabel('max AOI*');
plot(h1_f4,mAOI3_f4,'--');
xlabel('h1');ylabel('max AOI*');
plot(h1_f4,mAOI4_f4,'--');
xlabel('h1');ylabel('max AOI*');
plot(h1_f4,mAOI5_f4,'-*');
xlabel('h1');ylabel('max AOI*');
plot(h1_f4,mAOI6_f4,'-*');
xlabel('h1');ylabel('max AOI*');
legend('u=0.3 h2=6','u=0.3 h2=8','u=0.6 h2=6','u=0.6 h2=8','u=0.8 h2=6','u=0.8 h2=8')


figure(5);
subplot(2,2,1);
title('h2 = 4,AOI and its error');
yyaxis left
plot(h1_f5,minAOI1_f5);
xlabel('h1');ylabel('min max AOI');
yyaxis right
plot(h1_f5,MAXerror1_f5);
ylabel('its max error');
subplot(2,2,2);
title('h2 = 4,error and its AOI');
yyaxis left
plot(h1_f5,MAXAOI1_f5);
xlabel('h1');ylabel('min max AOI');
yyaxis right
plot(h1_f5,minerror1_f5);
ylabel('its max error');
subplot(2,2,3);
title('h2 = 8,AOI and its error');
yyaxis left
plot(h1_f5,minAOI3_f5);
xlabel('h1');ylabel('min max AOI');
yyaxis right
plot(h1_f5,MAXerror3_f5);
ylabel('its max error');
subplot(2,2,4);
title('h2 = 8,error and its AOI');
yyaxis left
plot(h1_f5,MAXAOI3_f5);
xlabel('h1');ylabel('min max AOI');
yyaxis right
plot(h1_f5,minerror3_f5);
ylabel('its max error');


figure(6);
yyaxis left
plot(d1_f6,TC);
xlabel('distance');ylabel('tc');
yyaxis right
plot(d1_f6,minAOI_f6);
ylabel('minAOI');