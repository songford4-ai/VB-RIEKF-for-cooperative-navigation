% close all
color4 = [252 160 93]/255;
color4 = [205 20 20]/255;
color5 = [190 190 190]/255;
color3 = [84 134 135]/255;
color1 = [71 51 53]/255;
color2 = [189 30 30]/255;
color6 = [252 160 93]/255;
color7 = [62, 102, 182]/255;

time = out.Nav.ISIU_Nav__signal_4_.EKFstate_M1.covariance_diag.Time;

%%

%%
figure(Name='R_out')
subplot1 = subplot(1,1,1)
indices = 1:100:length(time);
plot(unnamed(1,:),'LineStyle','-','Marker','diamond','MarkerSize',1.5,'LineWidth',1)
hold on;
plot(unnamed(4,:),'LineStyle','-','Marker','diamond','MarkerSize',1.5,'LineWidth',1)
plot(unnamed(3,:),'LineStyle','-','Marker','diamond','MarkerSize',1.5,'LineWidth',1)
plot(unnamed(2,:),'LineStyle','-','Marker','diamond','MarkerSize',1.5,'LineWidth',1)
plot(unnamed(5,:),'LineStyle','-','Marker','diamond','MarkerSize',1.5,'LineWidth',1)
plot(unnamed(6,:),'LineStyle','-','Marker','diamond','MarkerSize',1.5,'LineWidth',1)



ylabel('$$R_VB$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'$$R_{pos}$$','$$R_{vel}$$'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
% axis([0 600 -0.2 1.2]);
set(gca,'FontSize',12);
%%
figure(Name='SRNFN')
subplot1 = subplot(1,1,1)
indices = 1:100:length(time);

% 示例数据
M = 10; % 样本数量
n = 1;  % 状态向量的维度

hat=unnamed(1,:);
o = [zeros(1,2000)+0.1,zeros(1,2000)+3.16,zeros(1,2000)+0.1,zeros(1,2000)+3.16,zeros(1,2000)+0.1];
o = o(1:9911);
% 计算SRNFN
SRNFN_P = calculateSRNFN(hat, o, n, 9911);

% 显示结果
fprintf('SRNFN: %.4f\n', SRNFN_P);
plot(SRNFN_P,'LineStyle','-','Marker','diamond','MarkerSize',1.5,'LineWidth',1)



ylabel('$$R_VB$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'$$R_{pos}$$','$$R_{vel}$$'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
% axis([0 600 -0.2 1.2]);
set(gca,'FontSize',12);

%%  att     

h = figure(Name='att');
% set(h, 'Position', [2407.666666666667,143.6666666666667,991.3333333333335,688]);

subplot1 = subplot(3,1,1)
plot(time,out.Nav.ISIU_Nav__signal_4_.RotationData.phi_rad.Data(:,1),'LineWidth',2,'Color',color4)
hold on;
% plot(time,out.Nav.RIEKF_Nav__signal_5_.RotationData.phi_rad.Data(:,1),'LineWidth',2,'Color',color6)
% plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.RotationData.phi_rad.Data(:,1),'LineWidth',2,'LineStyle','-','Color',color3)
% plot(time,out.Nav.ES_EKFNav_M1__signal_9_.RotationData.phi_rad.Data(:,1), ...
    % 'LineWidth',2,'LineStyle','-','Color',color7)
% plot(time,out.Nav.attref__signal_7_.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)

ylabel('$$\phi\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1','REF'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
plot(time,out.Nav.ISIU_Nav__signal_4_.RotationData.psi_rad.Data(:,1),'LineWidth',1.5,'Color',color4)
hold on;
% plot(time,out.Nav.RIEKF_Nav__signal_5_.RotationData.psi_rad.Data(:,1),'LineWidth',2,'Color',color6)
% plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.RotationData.psi_rad.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color3)
% plot(time,out.Nav.ES_EKFNav_M1__signal_9_.RotationData.psi_rad.Data(:,1), ...
%     'LineWidth',2,'LineStyle','-','Color',color7)
% 
% plot(time,out.Nav.attref__signal_7_.Data(:,3),'LineStyle','--','LineWidth',2,'Color',color1)
ylabel('$$\psi\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1','REF'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)
plot(time,out.Nav.ISIU_Nav__signal_4_.RotationData.theta_rad.Data(:,1),'LineWidth',1.5,'Color',color4)
hold on;
% plot(time,out.Nav.RIEKF_Nav__signal_5_.RotationData.theta_rad.Data(:,1),'LineWidth',2,'Color',color6)
% plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.RotationData.theta_rad.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color3)
% plot(time,out.Nav.ES_EKFNav_M1__signal_9_.RotationData.theta_rad.Data(:,1), ...
%     'LineWidth',2,'LineStyle','-','Color',color7)

% plot(time,out.Nav.attref__signal_7_.Data(:,2),'LineStyle','--','LineWidth',2,'Color',color1)
ylabel('$$\theta\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1','REF'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

%% pos
figure(Name='pos')
subplot1 = subplot(3,1,1)
 plot(time,out.Nav.ISIU_Nav__signal_4_.TranlationData.pn_m.Data(:,1),'LineWidth',2,'Color',color4)
hold on;
plot(time,out.Nav.RIEKF_Nav__signal_5_.TranlationData.pn_m.Data(:,1),'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pn_m.Data(:,1),'LineWidth',2,'Color',color3)
 plot(time,out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pn_m.Data(:,1),'LineWidth',2,'Color',color7)

plot(time,out.Nav.SensorData1__signal_1_.pos_N_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_n\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1','REF'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
 plot(time,out.Nav.ISIU_Nav__signal_4_.TranlationData.pe_m.Data(:,1),'LineWidth',2,'Color',color4)
hold on;
plot(time,out.Nav.RIEKF_Nav__signal_5_.TranlationData.pe_m.Data(:,1),'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pe_m.Data(:,1),'LineWidth',2,'Color',color3)

plot(time,out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pe_m.Data(:,1),'LineWidth',2,'Color',color7)

 plot(time,out.Nav.SensorData1__signal_1_.pos_E_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_e\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1','REF'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)
plot(time,out.Nav.ISIU_Nav__signal_4_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color4)
hold on;
plot(time,out.Nav.RIEKF_Nav__signal_5_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color3)

plot(time,out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color7)

plot(time,out.Nav.SensorData1__signal_1_.pos_D_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_d\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1','REF'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

%% att error
clear ISIU_att_error;
clear RIEKF_att_error  RIEKFM2_att_error ESEKFM1_att_error;
h = figure(Name='atterr')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);
subplot1 = subplot(3,1,1)
ISIU_att_error(:,1) = abs(out.Nav.attref__signal_7_.Data(:,1) - out.Nav.ISIU_Nav__signal_4_.RotationData.phi_rad.Data(:,1));
RIEKF_att_error(:,1) = abs(out.Nav.attref__signal_7_.Data(:,1) - out.Nav.RIEKF_Nav__signal_5_.RotationData.phi_rad.Data(:,1));
RIEKFM2_att_error(:,1) = abs(out.Nav.attref__signal_7_.Data(:,1) - out.Nav.RIEKF_Nav_M2__signal_6_.RotationData.phi_rad.Data(:,1));
ESEKFM1_att_error(:,1) = abs(out.Nav.attref__signal_7_.Data(:,1) - out.Nav.ES_EKFNav_M1__signal_9_.RotationData.phi_rad.Data(:,1));

plot(time,ISIU_att_error(:,1),'LineWidth',3,'Color',color4,'LineStyle',':')
hold on;
plot(time,RIEKF_att_error(:,1),'LineWidth',2,'Color',color6)
plot(time,RIEKFM2_att_error(:,1),'LineWidth',2,'Color',color3)
plot(time,ESEKFM1_att_error(:,1),'LineWidth',2,'Color',color7)

ylabel('$$\delta \phi\,$$ [deg]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
ISIU_att_error(:,2) = abs(convertdpsi(abs(out.Nav.attref__signal_7_.Data(:,3) - out.Nav.ISIU_Nav__signal_4_.RotationData.psi_rad.Data(:,1))));
RIEKF_att_error(:,2) = abs(convertdpsi(abs(out.Nav.attref__signal_7_.Data(:,3) - out.Nav.RIEKF_Nav__signal_5_.RotationData.psi_rad.Data(:,1))));
RIEKFM2_att_error(:,2) = abs(convertdpsi(abs(out.Nav.attref__signal_7_.Data(:,3) - out.Nav.RIEKF_Nav_M2__signal_6_.RotationData.psi_rad.Data(:,1))));
ESEKFM1_att_error(:,2) = abs(convertdpsi(abs(out.Nav.attref__signal_7_.Data(:,3) - out.Nav.ES_EKFNav_M1__signal_9_.RotationData.psi_rad.Data(:,1))));

plot(time,ISIU_att_error(:,2),'LineWidth',3,'Color',color4,'LineStyle',':')
hold on;
plot(time,RIEKF_att_error(:,2),'LineWidth',2,'Color',color6)
plot(time,RIEKFM2_att_error(:,2),'LineWidth',2,'Color',color3)
plot(time,ESEKFM1_att_error(:,2),'LineWidth',2,'Color',color7)
ylabel('$$\delta\psi\,$$[deg]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);
axis([0,500,0,2.2]);

subplot1 = subplot(3,1,3)
ISIU_att_error(:,3) = abs(out.Nav.attref__signal_7_.Data(:,2) - out.Nav.ISIU_Nav__signal_4_.RotationData.theta_rad.Data(:,1));
RIEKF_att_error(:,3) = abs(out.Nav.attref__signal_7_.Data(:,2) - out.Nav.RIEKF_Nav__signal_5_.RotationData.theta_rad.Data(:,1));
RIEKFM2_att_error(:,3) = abs(out.Nav.attref__signal_7_.Data(:,2) - out.Nav.RIEKF_Nav_M2__signal_6_.RotationData.theta_rad.Data(:,1));
ESEKFM1_att_error(:,3) = abs(out.Nav.attref__signal_7_.Data(:,2) - out.Nav.ES_EKFNav_M1__signal_9_.RotationData.theta_rad.Data(:,1));

plot(time,ISIU_att_error(:,3),'LineWidth',3,'Color',color4,'LineStyle',':')
hold on;
plot(time,RIEKF_att_error(:,3),'LineWidth',2,'Color',color6)

plot(time,RIEKFM2_att_error(:,1),'LineWidth',2,'Color',color3)
plot(time,ESEKFM1_att_error(:,1),'LineWidth',2,'Color',color7)

ylabel('$$\delta\theta\,$$[deg]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10, ...
    'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);
%% 计算RMSE
rmse = sqrt(mean(sqrt(ISIU_att_error(:,1).^2+ISIU_att_error(:,2).^2+ISIU_att_error(:,3).^2)))
mse = mean(sqrt(ISIU_att_error(:,1).^2+ISIU_att_error(:,2).^2+ISIU_att_error(:,3).^2))
STD = std(sqrt(ISIU_att_error(:,1).^2+ISIU_att_error(:,2).^2+ISIU_att_error(:,3).^2))

rmse = sqrt(mean(sqrt(RIEKF_att_error(:,1).^2+RIEKF_att_error(:,2).^2+RIEKF_att_error(:,3).^2)))
mse = mean(sqrt(RIEKF_att_error(:,1).^2+RIEKF_att_error(:,2).^2+RIEKF_att_error(:,3).^2))
STD = std(sqrt(RIEKF_att_error(:,1).^2+RIEKF_att_error(:,2).^2+RIEKF_att_error(:,3).^2))

rmse = sqrt(mean(sqrt(RIEKFM2_att_error(:,1).^2+RIEKFM2_att_error(:,2).^2+RIEKFM2_att_error(:,3).^2)))
mse = mean(sqrt(RIEKFM2_att_error(:,1).^2+RIEKFM2_att_error(:,2).^2+RIEKFM2_att_error(:,3).^2))
STD = std(sqrt(RIEKFM2_att_error(:,1).^2+RIEKFM2_att_error(:,2).^2+RIEKFM2_att_error(:,3).^2))

rmse = sqrt(mean(sqrt(ESEKFM1_att_error(:,1).^2+ESEKFM1_att_error(:,2).^2+ESEKFM1_att_error(:,3).^2)))
mse = mean(sqrt(ESEKFM1_att_error(:,1).^2+ESEKFM1_att_error(:,2).^2+ESEKFM1_att_error(:,3).^2))
STD = std(sqrt(ESEKFM1_att_error(:,1).^2+ESEKFM1_att_error(:,2).^2+ESEKFM1_att_error(:,3).^2))


%% pos err
GNSS_enable_flag = out.Nav.RIEKF_Nav__signal_5_.GNSS_enable_flag.Data(:,1);
enable_index = find(GNSS_enable_flag == 1);
clear ISIU_pos_error;
clear RIEKF_pos_error  RIEKFM2_pos_error ESEKFM1_pos_error;
h = figure(Name='poserr')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);

subplot1 = subplot(3,1,1)
ISIU_pos_error(:,1) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_N.Data(enable_index,1) - out.Nav.ISIU_Nav__signal_4_.TranlationData.pn_m.Data(enable_index,1));
RIEKF_pos_error(:,1) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_N.Data(enable_index,1) - out.Nav.RIEKF_Nav__signal_5_.TranlationData.pn_m.Data(enable_index,1));
RIEKFM2_pos_error(:,1) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_N.Data(enable_index,1) - out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pn_m.Data(enable_index,1));
ESEKFM1_pos_error(:,1) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_N.Data(enable_index,1) - out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pn_m.Data(enable_index,1));


plot(time(enable_index),ISIU_pos_error(:,1),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),RIEKF_pos_error(:,1),'LineWidth',2,'Color',color6,'LineStyle','-')
plot(time(enable_index),RIEKFM2_pos_error(:,1),'LineWidth',2,'Color',color3)
plot(time(enable_index),ESEKFM1_pos_error(:,1),'LineWidth',2,'Color',color7)

ylabel('$$\delta p_N\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
ISIU_pos_error(:,2) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_E.Data(enable_index,1) - out.Nav.ISIU_Nav__signal_4_.TranlationData.pe_m.Data(enable_index,1));
RIEKF_pos_error(:,2) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_E.Data(enable_index,1) - out.Nav.RIEKF_Nav__signal_5_.TranlationData.pe_m.Data(enable_index,1));
RIEKFM2_pos_error(:,2) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_E.Data(enable_index,1) - out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pe_m.Data(enable_index,1));
ESEKFM1_pos_error(:,2) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_E.Data(enable_index,1) - out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pe_m.Data(enable_index,1));


plot(time(enable_index),ISIU_pos_error(:,2),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),RIEKF_pos_error(:,2),'LineWidth',2,'Color',color6,'LineStyle','-')
plot(time(enable_index),RIEKFM2_pos_error(:,2),'LineWidth',2,'Color',color3)
plot(time(enable_index),ESEKFM1_pos_error(:,2),'LineWidth',2,'Color',color7)
ylabel('$$\delta p_E\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)
ISIU_pos_error(:,3) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_D.Data(enable_index,1) - out.Nav.ISIU_Nav__signal_4_.TranlationData.pd_m.Data(enable_index,1));
RIEKF_pos_error(:,3) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_D.Data(enable_index,1) - out.Nav.RIEKF_Nav__signal_5_.TranlationData.pd_m.Data(enable_index,1));
RIEKFM2_pos_error(:,3) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_D.Data(enable_index,1) - out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pd_m.Data(enable_index,1));
ESEKFM1_pos_error(:,3) = abs(out.Nav.GPS1_noerr__signal_8_.gpspos_D.Data(enable_index,1) - out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pd_m.Data(enable_index,1));

plot(time(enable_index),ISIU_pos_error(:,3),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),RIEKF_pos_error(:,3),'LineWidth',2,'Color',color6,'LineStyle','-')
plot(time(enable_index),RIEKFM2_pos_error(:,3),'LineWidth',2,'Color',color3)
plot(time(enable_index),ESEKFM1_pos_error(:,3),'LineWidth',2,'Color',color7)
ylabel('$$\delta p_E\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

% poserr_ISIU_std = mean(ISIU_pos_error);
% poserr_ISIU_rmse = sqrt(sum(ISIU_pos_error.^2)/size(ISIU_pos_error,1));
% 
% poserr_RIEKF_std = mean(RIEKF_pos_error);
% poserr_RIEKF_rmse = sqrt(sum(RIEKF_pos_error.^2)/size(RIEKF_pos_error,1));
% 
% currentTime = datetime('now');
% formattedTime = datestr(currentTime, 'yyyymmdd_HHMMSS');

% fd =  fopen(strcat("误差统计\3GPS_no_other_noisy",formattedTime,".txt"),'w');
% 
% fprintf(fd,'poserr_ISIU_std = %f %f %f,-----poserr_ISIU_mean_std = %f\n poserr_ISIU_rmse = %f %f %f -----poserr_ISIU_mean_rmse = %f\n', ...
%     poserr_ISIU_std,mean(poserr_ISIU_std),poserr_ISIU_rmse,mean(poserr_ISIU_rmse));
% fprintf(fd,'poserr_RIEKF_std = %f %f %f,-----poserr_RIEKF_mean_std = %f\n poserr_RIEKF_rmse = %f %f %f -----poserr_RIEKF_mean_rmse = %f\n', ...
%     poserr_RIEKF_std,mean(poserr_RIEKF_std),poserr_RIEKF_rmse,mean(poserr_RIEKF_rmse));
% 
% 
% atterr_ISIU_std = mean(ISIU_att_error);
% atterr_ISIU_rmse = sqrt(sum(ISIU_att_error.^2)/size(ISIU_att_error,1));
% 
% atterr_RIEKF_std = mean(RIEKF_att_error);
% atterr_RIEKF_rmse = sqrt(sum(RIEKF_att_error.^2)/size(RIEKF_att_error,1));
% fprintf(fd,'atterr_ISIU_std = %f %f %f,-----atterr_ISIU_std_mean = %f\n atterr_ISIU_rmse = %f %f %f -----atterr_ISIU_rmse_mean = %f\n', ...
%     atterr_ISIU_std,mean(atterr_ISIU_std),atterr_ISIU_rmse,mean(atterr_ISIU_rmse));
% fprintf(fd,'atterr_RIEKF_std = %f %f %f,-----atterr_RIEKF_std_mean = %f\n atterr_RIEKF_rmse = %f %f %f -----atterr_RIEKF_rmse_mean = %f\n', ...
%     atterr_RIEKF_std,mean(atterr_RIEKF_std),atterr_RIEKF_rmse,mean(atterr_RIEKF_rmse));
% 
% fclose('all');

%% 
figure(Name='traj')
subplot1 = subplot(1,1,1);
hold on;
plot(out.Nav.SensorData1__signal_1_.pos_N_gps.Data(:,1), ...
    out.Nav.SensorData1__signal_1_.pos_E_gps.Data(:,1),'LineWidth',2,'Color',color1);
plot(out.Nav.SensorData2__signal_2_.pos_N_gps.Data(:,1), ...
    out.Nav.SensorData2__signal_2_.pos_E_gps.Data(:,1),'LineWidth',2,'Color',color6)
plot(out.Nav.SensorData2__signal_3_.pos_N_gps.Data(:,1), ...
    out.Nav.SensorData2__signal_3_.pos_E_gps.Data(:,1),'LineWidth',2,'Color',color5)
plot(out.Nav.ISIU_Nav__signal_4_.TranlationData.pn_m.Data(:,1), ...
    out.Nav.ISIU_Nav__signal_4_.TranlationData.pe_m.Data(:,1),'LineWidth',2,'Color',color3);
plot(out.Nav.RIEKF_Nav__signal_5_.TranlationData.pn_m.Data(:,1), ...
    out.Nav.RIEKF_Nav__signal_5_.TranlationData.pe_m.Data(:,1),'LineWidth',2,'Color',color4);
ylabel('$$pos_N\,[m]$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('$$pos_E\,[m]$$','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'RTK Model 1','RTK Model 2','RTK Model 3','ISIU-RIEKF','RIEKF'}, ...
    'NumColumns',4,'Location','north','FontSize',10);
legend('boxoff');

%% GPS plot
figure('Name','3Dtraj')
subplot1 = subplot(1,1,1)
plot3(out.Nav.SensorData1__signal_1_.pos_E_gps.Data(:,1), ...
    out.Nav.SensorData1__signal_1_.pos_N_gps.Data(:,1), ...
    -out.Nav.SensorData1__signal_1_.pos_D_gps.Data(:,1),'LineWidth',2,'Color',color2);

ylabel('$$pos_N\,$$[m]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('$$pos_E\,$$[m]','FontSize',12,'FontName','Times','Interpreter','latex');
zlabel('$$pos_H\,$$[m]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'Trajectory'},'NumColumns',4,'Location','north','FontSize',10);
legend('boxoff');
axis([-5000 5000 -5000 2000 -50 350])
%% GPS plot——xy
figure('Name','3Dtraj')
subplot1 = subplot(1,1,1)
plot(out.Nav.SensorData1__signal_1_.pos_E_gps.Data(:,1), ...
    out.Nav.SensorData1__signal_1_.pos_N_gps.Data(:,1), ...
    'LineWidth',2,'Color',color2);
% zp = BaseZoom();
% zp.run();
ylabel('$$pos_N\,$$[m]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('$$pos_E\,$$[m]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'Trajectory'},'NumColumns',4,'Location','north','FontSize',10);
legend('boxoff');
axis([-5000 5000 -5000 2000 -50 350])
%% innovation
h = figure(Name='measure innovation')
set(h, 'Position', [2407.666666666667,143.6666666666667,991.3333333333335,688]);

GNSS_enable_flag = out.Nav.RIEKF_Nav__signal_5_.GNSS_enable_flag.Data(:,1);
enable_index = find(GNSS_enable_flag == 1);
enable_index = enable_index(1:20:end);
subplot1 = subplot(3,2,1)
plot(time(enable_index,1),out.Nav.ISIU_Nav__signal_4_.EKFstate_M1.m_innov_z0.Data(enable_index,1),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index,1),out.Nav.ISIU_Nav__signal_4_.EKFstate_M2.m_innov_z0.Data(enable_index,1),'LineWidth',2,'Color',color6)
plot(time(enable_index,1),out.Nav.ISIU_Nav__signal_4_.EKFstate_M3.m_innov_z0.Data(enable_index,1),'LineWidth',2,'Color',color3)

ylabel('$$\mathcal{Y}_{v_n}$$ [m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'Model 1','Model 2','Model 3'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);
axis([0 500 -0.5 0.9 ])

subplot1 = subplot(3,2,3)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M1.m_innov_z0.Data(enable_index,2),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M2.m_innov_z0.Data(enable_index,2),'LineWidth',2,'Color',color6)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M3.m_innov_z0.Data(enable_index,2),'LineWidth',2,'Color',color3)

ylabel('$$\mathcal{Y}_{v_e}$$ [m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'Model 1','Model 2','Model 3'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,2,5)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M1.m_innov_z0.Data(enable_index,3),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M2.m_innov_z0.Data(enable_index,3),'LineWidth',2,'Color',color6)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M3.m_innov_z0.Data(enable_index,3),'LineWidth',2,'Color',color3)

ylabel('$$\mathcal{Y}_{v_d}$$ [m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'Model 1','Model 2','Model 3'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,2,2)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M1.m_innov_z0.Data(enable_index,4),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M2.m_innov_z0.Data(enable_index,4),'LineWidth',2,'Color',color6)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M3.m_innov_z0.Data(enable_index,4),'LineWidth',2,'Color',color3)

ylabel('$$\mathcal{Y}_{p_n}$$ [m]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'Model 1','Model 2','Model 3'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,2,4)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M1.m_innov_z0.Data(enable_index,5),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M2.m_innov_z0.Data(enable_index,5),'LineWidth',2,'Color',color6)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M3.m_innov_z0.Data(enable_index,5),'LineWidth',2,'Color',color3)

ylabel('$$\mathcal{Y}_{p_e}$$ [m]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'Model 1','Model 2','Model 3'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,2,6)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M1.m_innov_z0.Data(enable_index,6),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M2.m_innov_z0.Data(enable_index,6),'LineWidth',2,'Color',color6)
plot(time(enable_index),out.Nav.ISIU_Nav__signal_4_.EKFstate_M3.m_innov_z0.Data(enable_index,6),'LineWidth',2,'Color',color3)

ylabel('$$\mathcal{Y}_{p_d}$$ [m]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'Model 1','Model 2','Model 3'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

% 
% print(h, 'Figure\innovation_3GPS.pdf', '-dpdf', '-r300');
%% %% pos err 2
GNSS_enable_flag = out.Nav.RIEKF_Nav__signal_5_.GNSS_enable_flag.Data(:,1);
enable_index = find(GNSS_enable_flag == 1);
clear ISIU_pos_error;
clear RIEKF_pos_error  RIEKFM2_pos_error ESEKFM1_pos_error;
h = figure(Name='poserr')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);

subplot1 = subplot(3,1,1)
gpspos_N = (out.Nav.GPS1_noerr__signal_8_.gpspos_N.Data(enable_index,1) + out.Nav.SensorData2__signal_2_.pos_N_gps.Data(enable_index,1))./2;
ISIU_pos_error(:,1) = abs(gpspos_N - out.Nav.ISIU_Nav__signal_4_.TranlationData.pn_m.Data(enable_index,1));
RIEKF_pos_error(:,1) = abs(gpspos_N - out.Nav.RIEKF_Nav__signal_5_.TranlationData.pn_m.Data(enable_index,1));
RIEKFM2_pos_error(:,1) = abs(gpspos_N - out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pn_m.Data(enable_index,1));
ESEKFM1_pos_error(:,1) = abs(gpspos_N - out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pn_m.Data(enable_index,1));

h = 100;
% ISIU_pos_error(:,1) = remove_spike_with_previous_frame(ISIU_pos_error(:,1),h);
% RIEKF_pos_error(:,1) = remove_spike_with_previous_frame(RIEKF_pos_error(:,1),h);
% RIEKFM2_pos_error(:,1) = remove_spike_with_previous_frame(RIEKFM2_pos_error(:,1),h);
% ESEKFM1_pos_error(:,1) = remove_spike_with_previous_frame(ESEKFM1_pos_error(:,1),h);
cutoff_freq = 1;
sampling_rate = 20;
ISIU_pos_error(:,1) = lowpass_filter_simple(ISIU_pos_error(:,1),cutoff_freq, sampling_rate);
RIEKF_pos_error(:,1) = lowpass_filter_simple(RIEKF_pos_error(:,1),cutoff_freq, sampling_rate);
RIEKFM2_pos_error(:,1) = lowpass_filter_simple(RIEKFM2_pos_error(:,1),cutoff_freq, sampling_rate);
ESEKFM1_pos_error(:,1) = lowpass_filter_simple(ESEKFM1_pos_error(:,1),cutoff_freq, sampling_rate);
plot(time(enable_index),ISIU_pos_error(:,1),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),RIEKF_pos_error(:,1),'LineWidth',2,'Color',color6,'LineStyle','-')
plot(time(enable_index),RIEKFM2_pos_error(:,1),'LineWidth',2,'Color',color3)
plot(time(enable_index),ESEKFM1_pos_error(:,1),'LineWidth',2,'Color',color7)

ylabel('$$\delta p_N\,$$[m]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
gpspos_E = (out.Nav.GPS1_noerr__signal_8_.gpspos_E.Data(enable_index,1) + out.Nav.SensorData2__signal_2_.pos_E_gps.Data(enable_index,1))./2;

ISIU_pos_error(:,2) = abs(gpspos_E - out.Nav.ISIU_Nav__signal_4_.TranlationData.pe_m.Data(enable_index,1));
RIEKF_pos_error(:,2) = abs(gpspos_E - out.Nav.RIEKF_Nav__signal_5_.TranlationData.pe_m.Data(enable_index,1));
RIEKFM2_pos_error(:,2) = abs(gpspos_E - out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pe_m.Data(enable_index,1));
ESEKFM1_pos_error(:,2) = abs(gpspos_E - out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pe_m.Data(enable_index,1));

ISIU_pos_error(:,2) = lowpass_filter_simple(ISIU_pos_error(:,2),cutoff_freq, sampling_rate);
RIEKF_pos_error(:,2) = lowpass_filter_simple(RIEKF_pos_error(:,2),cutoff_freq, sampling_rate);
RIEKFM2_pos_error(:,2) = lowpass_filter_simple(RIEKFM2_pos_error(:,2),cutoff_freq, sampling_rate);
ESEKFM1_pos_error(:,2) = lowpass_filter_simple(ESEKFM1_pos_error(:,2),cutoff_freq, sampling_rate);


plot(time(enable_index),ISIU_pos_error(:,2),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),RIEKF_pos_error(:,2),'LineWidth',2,'Color',color6,'LineStyle','-')
plot(time(enable_index),RIEKFM2_pos_error(:,2),'LineWidth',2,'Color',color3)
plot(time(enable_index),ESEKFM1_pos_error(:,2),'LineWidth',2,'Color',color7)
ylabel('$$\delta p_E\,$$[m]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)
gpspos_D = (out.Nav.GPS1_noerr__signal_8_.gpspos_D.Data(enable_index,1) + out.Nav.SensorData2__signal_2_.pos_D_gps.Data(enable_index,1))./2;

ISIU_pos_error(:,3) = abs(gpspos_D - out.Nav.ISIU_Nav__signal_4_.TranlationData.pd_m.Data(enable_index,1));
RIEKF_pos_error(:,3) = abs(gpspos_D - out.Nav.RIEKF_Nav__signal_5_.TranlationData.pd_m.Data(enable_index,1));
RIEKFM2_pos_error(:,3) = abs(gpspos_D - out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pd_m.Data(enable_index,1));
ESEKFM1_pos_error(:,3) = abs(gpspos_D - out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pd_m.Data(enable_index,1));

ISIU_pos_error(:,3) = lowpass_filter_simple(ISIU_pos_error(:,3),cutoff_freq, sampling_rate);
RIEKF_pos_error(:,3) = lowpass_filter_simple(RIEKF_pos_error(:,3),cutoff_freq, sampling_rate);
RIEKFM2_pos_error(:,3) = lowpass_filter_simple(RIEKFM2_pos_error(:,3),cutoff_freq, sampling_rate);
ESEKFM1_pos_error(:,3) = lowpass_filter_simple(ESEKFM1_pos_error(:,3),cutoff_freq, sampling_rate);

plot(time(enable_index),ISIU_pos_error(:,3),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),RIEKF_pos_error(:,3),'LineWidth',2,'Color',color6,'LineStyle','-')
plot(time(enable_index),RIEKFM2_pos_error(:,3),'LineWidth',2,'Color',color3)
plot(time(enable_index),ESEKFM1_pos_error(:,3),'LineWidth',2,'Color',color7)
ylabel('$$\delta p_D\,$$[m]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

% 计算RMSE
rmse = sqrt(mean(sqrt(ISIU_pos_error(:,1).^2+ISIU_pos_error(:,2).^2+ISIU_pos_error(:,3).^2)))
mse = mean(sqrt(ISIU_pos_error(:,1).^2+ISIU_pos_error(:,2).^2+ISIU_pos_error(:,3).^2))
STD = std(sqrt(ISIU_pos_error(:,1).^2+ISIU_pos_error(:,2).^2+ISIU_pos_error(:,3).^2))

%% VEL
figure(Name='pos')
subplot1 = subplot(3,1,1)
plot(time,out.Nav.ISIU_Nav__signal_4_.TranlationData.vn_m_s.Data(:,1),'LineWidth',2,'Color',color4)
hold on;
% plot(time,out.Nav.RIEKF_Nav__signal_5_.TranlationData.pn_m.Data(:,1),'LineWidth',2,'Color',color6)
% plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pn_m.Data(:,1),'LineWidth',2,'Color',color3)
% plot(time,out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pn_m.Data(:,1),'LineWidth',2,'Color',color7)

% plot(time,out.Nav.SensorData1__signal_1_.pos_N_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_n\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1','REF'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
plot(time,out.Nav.ISIU_Nav__signal_4_.TranlationData.ve_m_s.Data(:,1),'LineWidth',2,'Color',color4)
hold on;
% plot(time,out.Nav.RIEKF_Nav__signal_5_.TranlationData.pe_m.Data(:,1),'LineWidth',2,'Color',color6)
% plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pe_m.Data(:,1),'LineWidth',2,'Color',color3)
% 
% plot(time,out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pe_m.Data(:,1),'LineWidth',2,'Color',color7)
% 
% plot(time,out.Nav.SensorData1__signal_1_.pos_E_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_e\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1','REF'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)
plot(time,out.Nav.ISIU_Nav__signal_4_.TranlationData.vd_m_s.Data(:,1),'LineWidth',2,'Color',color4)
hold on;
% plot(time,out.Nav.RIEKF_Nav__signal_5_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color6)
% plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color3)
% 
% plot(time,out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color7)
% 
% plot(time,out.Nav.SensorData1__signal_1_.pos_D_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_d\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1','REF'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);
%% %% vel err
GNSS_enable_flag = out.Nav.RIEKF_Nav__signal_5_.GNSS_enable_flag.Data(:,1);
enable_index = find(GNSS_enable_flag == 1);
clear ISIU_vel_error;
clear RIEKF_vel_error  RIEKFM2_vel_error ESEKFM1_vel_error;
h = figure(Name='velerr')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);

subplot1 = subplot(3,1,1)
gpsvel_N = (out.Nav.SensorData1__signal_1_.vn_gps.Data(enable_index,1) + out.Nav.SensorData1__signal_1_.vn_gps.Data(enable_index,1))./2;
ISIU_vel_error(:,1) = abs(gpsvel_N - out.Nav.ISIU_Nav__signal_4_.TranlationData.vn_m_s.Data(enable_index,1));
RIEKF_vel_error(:,1) = abs(gpsvel_N - out.Nav.RIEKF_Nav__signal_5_.TranlationData.vn_m_s.Data(enable_index,1));
RIEKFM2_vel_error(:,1) = abs(gpsvel_N - out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.vn_m_s.Data(enable_index,1));
ESEKFM1_vel_error(:,1) = abs(gpsvel_N - out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.vn_m_s.Data(enable_index,1));

h = 100;
% ISIU_pos_error(:,1) = remove_spike_with_previous_frame(ISIU_pos_error(:,1),h);
% RIEKF_pos_error(:,1) = remove_spike_with_previous_frame(RIEKF_pos_error(:,1),h);
% RIEKFM2_pos_error(:,1) = remove_spike_with_previous_frame(RIEKFM2_pos_error(:,1),h);
% ESEKFM1_pos_error(:,1) = remove_spike_with_previous_frame(ESEKFM1_pos_error(:,1),h);
cutoff_freq = 1;
sampling_rate = 20;
ISIU_vel_error(:,1) = lowpass_filter_simple(ISIU_vel_error(:,1),cutoff_freq, sampling_rate);
RIEKF_vel_error(:,1) = lowpass_filter_simple(RIEKF_vel_error(:,1),cutoff_freq, sampling_rate);
RIEKFM2_vel_error(:,1) = lowpass_filter_simple(RIEKFM2_vel_error(:,1),cutoff_freq, sampling_rate);
ESEKFM1_vel_error(:,1) = lowpass_filter_simple(ESEKFM1_vel_error(:,1),cutoff_freq, sampling_rate);
plot(time(enable_index),ISIU_vel_error(:,1),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),RIEKF_vel_error(:,1),'LineWidth',2,'Color',color6,'LineStyle','-')
plot(time(enable_index),RIEKFM2_vel_error(:,1),'LineWidth',2,'Color',color3)
plot(time(enable_index),ESEKFM1_vel_error(:,1),'LineWidth',2,'Color',color7)

ylabel('$$\delta v_N\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
gpsvel_E = (out.Nav.SensorData1__signal_1_.ve_gps.Data(enable_index,1) + out.Nav.SensorData1__signal_1_.ve_gps.Data(enable_index,1))./2;

ISIU_vel_error(:,2) = abs(gpsvel_E - out.Nav.ISIU_Nav__signal_4_.TranlationData.ve_m_s.Data(enable_index,1));
RIEKF_vel_error(:,2) = abs(gpsvel_E - out.Nav.RIEKF_Nav__signal_5_.TranlationData.ve_m_s.Data(enable_index,1));
RIEKFM2_vel_error(:,2) = abs(gpsvel_E - out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.ve_m_s.Data(enable_index,1));
ESEKFM1_vel_error(:,2) = abs(gpsvel_E - out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.ve_m_s.Data(enable_index,1));

ISIU_vel_error(:,2) = lowpass_filter_simple(ISIU_vel_error(:,2),cutoff_freq, sampling_rate);
RIEKF_vel_error(:,2) = lowpass_filter_simple(RIEKF_vel_error(:,2),cutoff_freq, sampling_rate);
RIEKFM2_vel_error(:,2) = lowpass_filter_simple(RIEKFM2_vel_error(:,2),cutoff_freq, sampling_rate);
ESEKFM1_vel_error(:,2) = lowpass_filter_simple(ESEKFM1_vel_error(:,2),cutoff_freq, sampling_rate);


plot(time(enable_index),ISIU_vel_error(:,2),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),RIEKF_vel_error(:,2),'LineWidth',2,'Color',color6,'LineStyle','-')
plot(time(enable_index),RIEKFM2_vel_error(:,2),'LineWidth',2,'Color',color3)
plot(time(enable_index),ESEKFM1_vel_error(:,2),'LineWidth',2,'Color',color7)
ylabel('$$\delta v_E\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)
gpsvel_D = (out.Nav.SensorData1__signal_1_.vd_gps.Data(enable_index,1) + out.Nav.SensorData1__signal_1_.vd_gps.Data(enable_index,1))./2;

ISIU_vel_error(:,3) = abs(gpsvel_D - out.Nav.ISIU_Nav__signal_4_.TranlationData.vd_m_s.Data(enable_index,1));
RIEKF_vel_error(:,3) = abs(gpsvel_D - out.Nav.RIEKF_Nav__signal_5_.TranlationData.vd_m_s.Data(enable_index,1));
RIEKFM2_vel_error(:,3) = abs(gpsvel_D - out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.vd_m_s.Data(enable_index,1));
ESEKFM1_vel_error(:,3) = abs(gpsvel_D - out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.vd_m_s.Data(enable_index,1));

ISIU_vel_error(:,3) = lowpass_filter_simple(ISIU_vel_error(:,3),cutoff_freq, sampling_rate);
RIEKF_vel_error(:,3) = lowpass_filter_simple(RIEKF_vel_error(:,3),cutoff_freq, sampling_rate);
RIEKFM2_vel_error(:,3) = lowpass_filter_simple(RIEKFM2_vel_error(:,3),cutoff_freq, sampling_rate);
ESEKFM1_vel_error(:,3) = lowpass_filter_simple(ESEKFM1_vel_error(:,3),cutoff_freq, sampling_rate);

plot(time(enable_index),ISIU_vel_error(:,3),'LineWidth',2,'Color',color4)
hold on;
plot(time(enable_index),RIEKF_vel_error(:,3),'LineWidth',2,'Color',color6,'LineStyle','-')
plot(time(enable_index),RIEKFM2_vel_error(:,3),'LineWidth',2,'Color',color3)
plot(time(enable_index),ESEKFM1_vel_error(:,3),'LineWidth',2,'Color',color7)
ylabel('$$\delta v_D\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);
% 计算RMSE
rmse = sqrt(mean(sqrt(ISIU_vel_error(:,1).^2+ISIU_vel_error(:,2).^2+ISIU_vel_error(:,3).^2)))
mse = mean(sqrt(ISIU_vel_error(:,1).^2+ISIU_vel_error(:,2).^2+ISIU_vel_error(:,3).^2))
STD = std(sqrt(ISIU_vel_error(:,1).^2+ISIU_vel_error(:,2).^2+ISIU_vel_error(:,3).^2))

%% .bias
h = figure(Name='pos')
set(h, 'Position', [2407.666666666667,143.6666666666667,991.3333333333335,688]);
subplot1 = subplot(3,2,1)
plot(time,out.Nav.ISIU_Nav__signal_4_.INSbiasData.INSstate_dg.Data(:,1)*206264.81,'LineWidth',2,'Color',color4)
hold on;
plot(time,out.Nav.RIEKF_Nav__signal_5_.INSbiasData.INSstate_dg.Data(:,1)*206264.81,'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.INSbiasData.INSstate_dg.Data(:,1)*206264.81,'LineWidth',2,'Color',color3)
plot(time,out.Nav.ES_EKFNav_M1__signal_9_.INSbiasData.INSstate_dg.Data(:,1)*206264.81,'LineWidth',2,'Color',color7)

%plot(time,out.Nav.SensorData1__signal_1_.pos_N_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$b_{gx}\,$$[deg/h]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,2,3)
plot(time,out.Nav.ISIU_Nav__signal_4_.INSbiasData.INSstate_dg.Data(:,2),'LineWidth',2,'Color',color4)
hold on;
plot(time,out.Nav.RIEKF_Nav__signal_5_.INSbiasData.INSstate_dg.Data(:,2),'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.INSbiasData.INSstate_dg.Data(:,2),'LineWidth',2,'Color',color3)

plot(time,out.Nav.ES_EKFNav_M1__signal_9_.INSbiasData.INSstate_dg.Data(:,2),'LineWidth',2,'Color',color7)

%plot(time,out.Nav.SensorData1__signal_1_.pos_E_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_e\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,2,5)
plot(time,out.Nav.ISIU_Nav__signal_4_.INSbiasData.INSstate_dg.Data(:,3),'LineWidth',2,'Color',color4)
hold on;
plot(time,out.Nav.RIEKF_Nav__signal_5_.INSbiasData.INSstate_dg.Data(:,3),'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.INSbiasData.INSstate_dg.Data(:,3),'LineWidth',2,'Color',color3)

plot(time,out.Nav.ES_EKFNav_M1__signal_9_.INSbiasData.INSstate_dg.Data(:,3),'LineWidth',2,'Color',color7)

%plot(time,out.Nav.SensorData1__signal_1_.pos_D_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_d\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,2,2)
plot(time,out.Nav.ISIU_Nav__signal_4_.INSbiasData.INSstate_da.Data(:,1),'LineWidth',2,'Color',color4)
hold on;
plot(time,out.Nav.RIEKF_Nav__signal_5_.INSbiasData.INSstate_da.Data(:,1),'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.INSbiasData.INSstate_da.Data(:,1),'LineWidth',2,'Color',color3)
plot(time,out.Nav.ES_EKFNav_M1__signal_9_.INSbiasData.INSstate_da.Data(:,1),'LineWidth',2,'Color',color7)

%plot(time,out.Nav.SensorData1__signal_1_.pos_N_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_n\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,2,4)
plot(time,out.Nav.ISIU_Nav__signal_4_.INSbiasData.INSstate_da.Data(:,2),'LineWidth',2,'Color',color4)
hold on;
plot(time,out.Nav.RIEKF_Nav__signal_5_.INSbiasData.INSstate_da.Data(:,2),'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.INSbiasData.INSstate_da.Data(:,2),'LineWidth',2,'Color',color3)

plot(time,out.Nav.ES_EKFNav_M1__signal_9_.INSbiasData.INSstate_da.Data(:,2),'LineWidth',2,'Color',color7)

%plot(time,out.Nav.SensorData1__signal_1_.pos_E_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_e\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,2,6)
plot(time,out.Nav.ISIU_Nav__signal_4_.INSbiasData.INSstate_da.Data(:,3),'LineWidth',2,'Color',color4)
hold on;
plot(time,out.Nav.RIEKF_Nav__signal_5_.INSbiasData.INSstate_da.Data(:,3),'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.INSbiasData.INSstate_da.Data(:,3),'LineWidth',2,'Color',color3)

plot(time,out.Nav.ES_EKFNav_M1__signal_9_.INSbiasData.INSstate_da.Data(:,3),'LineWidth',2,'Color',color7)

%plot(time,out.Nav.SensorData1__signal_1_.pos_D_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',color1)
ylabel('$$p_d\,$$','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

%% houwei
h = figure(Name='pos')
set(h, 'Position', [2603,148.3333333333333,666,462.6666666666667]);
subplot1 = subplot(1,1,1)
hold on;
plot(time,out.Nav.SensorData1__signal_1_.pos_D_gps.Data(:,1),'LineWidth',2,'LineStyle','--','Color',[0.90,0.90,0.90], ...
    'Marker','+','MarkerEdgeColor',[0.65,0.65,0.65],'MarkerSize',4)
%plot(time,out.Nav.GPS1_noerr__signal_8_.gpspos_D.Data(:,1),'LineWidth',2,'Color',color1)

plot(time,out.Nav.ISIU_Nav__signal_4_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color4)

plot(time,out.Nav.RIEKF_Nav__signal_5_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color6)
plot(time,out.Nav.RIEKF_Nav_M2__signal_6_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color3)

plot(time,out.Nav.ES_EKFNav_M1__signal_9_.TranlationData.pd_m.Data(:,1),'LineWidth',2,'Color',color7)

ylabel('$$p_d\,$$ [m]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'RTK GPS 1 with shot noise','IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1',},'NumColumns',4,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);
axis([100,200,-300,-292])

%% 补充主机动力学辅助导航补偿内容测试
%需另外运行文件

color4 = [252 160 93]/255;
color4 = [205 20 20]/255;
color5 = [190 190 190]/255;
color3 = [84 134 135]/255;
color1 = [71 51 53]/255;
color2 = [189 30 30]/255;
color6 = [252 160 93]/255;
color7 = [62, 102, 182]/255;
time = out.Nav.ES_EKFNav_M1.GNSS_enable_flag.Time;

%% pos


h = figure(Name='pos')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);

subplot1 = subplot(3,1,1)
% plot(out_slave.Nav.ES_EKFNav_M1.TranlationData.pn_m,'LineWidth',2,'Color',color1)
hold on;
plot(time,out_slave_denied_80.RIEKF_PNED.signals(1).values,'LineWidth',2,'Color',color6)
plot(time,out_slave_vair_80.RIEKF_PNED.signals(1).values,'LineWidth',2,'Color',color3)
plot(time,out_slave_uwb.RIEKF_PNED.signals(1).values,'LineWidth',2,'Color',color4)


ylabel('$$\delta v_N\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
% plot(out_slave.Nav.ES_EKFNav_M1.TranlationData.pe_m,'LineWidth',2,'Color',color1)
hold on;
plot(time,out_slave_denied_80.RIEKF_PNED.signals(2).values,'LineWidth',2,'Color',color6)
plot(time,out_slave_vair_80.RIEKF_PNED.signals(2).values,'LineWidth',2,'Color',color3)
plot(time,out_slave_uwb.RIEKF_PNED.signals(2).values,'LineWidth',2,'Color',color4)

ylabel('$$\delta v_E\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)

% plot(out_slave.Nav.ES_EKFNav_M1.TranlationData.pd_m,'LineWidth',2,'Color',color1)
hold on;
plot(time,out_slave_denied_80.RIEKF_PNED.signals(3).values,'LineWidth',2,'Color',color6)
plot(time,out.RIEKF_PNED.signals(3).values,'LineWidth',2,'Color',color3)
plot(time,out_slave_uwb.RIEKF_PNED.signals(3).values,'LineWidth',2,'Color',color4)

ylabel('$$\delta v_D\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

%% vel

time = out.Nav.ES_EKFNav_M1.GNSS_enable_flag.Time;

h = figure(Name='pos')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);

subplot1 = subplot(3,1,1)
% plot(out_slave.Nav.ES_EKFNav_M1.TranlationData.vn_m_s,'LineWidth',2,'Color',color1)
hold on;
plot(time,out_slave_denied_80.RIEKF_VNED.signals(1).values,'LineWidth',2,'Color',color6)
plot(time,out_slave_vair_80.RIEKF_VNED.signals(1).values,'LineWidth',2,'Color',color3)
plot(time,out_slave_uwb.RIEKF_VNED.signals(1).values,'LineWidth',2,'Color',color4)


ylabel('$$\delta v_N\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
% plot(out_slave.Nav.ES_EKFNav_M1.TranlationData.ve_m_s,'LineWidth',2,'Color',color1)
hold on;
plot(time,out_slave_denied_80.RIEKF_VNED.signals(2).values,'LineWidth',2,'Color',color6)
plot(time,out_slave_vair_80.RIEKF_VNED.signals(2).values,'LineWidth',2,'Color',color3)
plot(time,out_slave_uwb.RIEKF_VNED.signals(2).values,'LineWidth',2,'Color',color4)

ylabel('$$\delta v_E\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)

% plot(out_slave.Nav.ES_EKFNav_M1.TranlationData.vd_m_s,'LineWidth',2,'Color',color1)
hold on;
plot(time,out_slave_denied_80.RIEKF_VNED.signals(3).values,'LineWidth',2,'Color',color6)
plot(time,out_slave_vair_80.RIEKF_VNED.signals(3).values,'LineWidth',2,'Color',color3)
plot(time,out_slave_uwb.RIEKF_VNED.signals(3).values,'LineWidth',2,'Color',color4)

ylabel('$$\delta v_D\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

%% att

time = out.Nav.ES_EKFNav_M1.GNSS_enable_flag.Time;

h = figure(Name='pos')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);

subplot1 = subplot(3,1,1)
% plot(out_slave.Nav.ES_EKFNav_M1.RotationData.psi_rad,'LineWidth',2,'Color',color1)
hold on;
plot(time,out_slave_denied_80.RIEKF_ATT.signals(1).values,'LineWidth',2,'Color',color6)
plot(time,out_slave_vair_80.RIEKF_ATT.signals(1).values,'LineWidth',2,'Color',color3)
plot(time,out_slave_uwb.RIEKF_ATT.signals(1).values,'LineWidth',2,'Color',color4)


ylabel('$$\delta v_N\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
% plot(out_slave.Nav.ES_EKFNav_M1.RotationData.theta_rad,'LineWidth',2,'Color',color1)
hold on;
plot(time,out_slave_denied_80.RIEKF_ATT.signals(2).values,'LineWidth',2,'Color',color6)
plot(time,out_slave_vair_80.RIEKF_ATT.signals(2).values,'LineWidth',2,'Color',color3)
plot(time,out_slave_uwb.RIEKF_ATT.signals(2).values,'LineWidth',2,'Color',color4)

ylabel('$$\delta v_E\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)

% plot(out_slave.Nav.ES_EKFNav_M1.RotationData.phi_rad,'LineWidth',2,'Color',color1)
hold on;
plot(time,out_slave_denied.RIEKF_ATT.signals(3).values,'LineWidth',2,'Color',color6)
plot(time,out_slave_vair.RIEKF_ATT.signals(3).values,'LineWidth',2,'Color',color3)
plot(time,out_slave_uwb.RIEKF_ATT.signals(3).values,'LineWidth',2,'Color',color4)

ylabel('$$\delta v_D\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

%% poserr11
% time = out.Nav.ES_EKFNav_M1.GNSS_enable_flag.Time;

h = figure(Name='pos')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);
subplot1 = subplot(3,1,1)
gpspos_N = (out.Nav.GPS1_noerr.gpspos_N.Data + out.Nav.SensorData2.pos_N_gps.Data)./2;

% ESEKF_uwb_pos_error(:,1) = abs(gpspos_N - out_slave_uwb.ESEKF_PNED.signals(1).values);
denied_pos_error(:,1) = abs(gpspos_N - out_slave_denied_80.RIEKF_PNED.signals(1).values);
vair_pos_error(:,1) = abs(gpspos_N - out_slave_vair_80.RIEKF_PNED.signals(1).values);
ESEKFM1_pos_error(:,1) = abs(gpspos_N - out_slave_uwb.RIEKF_PNED.signals(1).values);


hold on;
% plot(time,ESEKF_uwb_pos_error(:,1),'LineWidth',2,'Color',color6)
hold on;
plot(time,denied_pos_error(:,1),'LineWidth',2,'Color',color6)
plot(time,vair_pos_error(:,1),'LineWidth',2,'Color',color3)
plot(time,ESEKFM1_pos_error(:,1),'LineWidth',2,'Color',color4)


ylabel('$$\delta v_N\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
gpspos_E = (out.Nav.GPS1_noerr.gpspos_E.Data + out.Nav.SensorData2.pos_E_gps.Data)./2;

% ESEKF_uwb_pos_error(:,2) = abs(gpspos_E - out_slave_uwb.ESEKF_PNED.signals(2).values);
denied_pos_error(:,2) = abs(gpspos_E - out_slave_denied_80.RIEKF_PNED.signals(2).values);
vair_pos_error(:,2) = abs(gpspos_E - out_slave_vair_80.RIEKF_PNED.signals(2).values);
ESEKFM1_pos_error(:,2) = abs(gpspos_E - out_slave_uwb.RIEKF_PNED.signals(2).values);


hold on;
% plot(time,ESEKF_uwb_pos_error(:,2),'LineWidth',2,'Color',color6)
hold on;
plot(time,denied_pos_error(:,2),'LineWidth',2,'Color',color6)
plot(time,vair_pos_error(:,2),'LineWidth',2,'Color',color3)
plot(time,ESEKFM1_pos_error(:,2),'LineWidth',2,'Color',color4)
ylabel('$$\delta v_E\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)
gpspos_D = (out.Nav.GPS1_noerr.gpspos_D.Data + out.Nav.SensorData2.pos_D_gps.Data)./2;

% ESEKF_uwb_pos_error(:,3) = abs(gpspos_D - out_slave_uwb.ESEKF_PNED.signals(3).values);
denied_pos_error(:,3) = abs(gpspos_D - out_slave_denied.RIEKF_PNED.signals(3).values);
vair_pos_error(:,3) = abs(gpspos_D - out.RIEKF_PNED.signals(3).values);
ESEKFM1_pos_error(:,3) = abs(gpspos_D - out_slave_uwb.RIEKF_PNED.signals(3).values);


hold on;
% plot(time,ESEKF_uwb_pos_error(:,3),'LineWidth',2,'Color',color6)
hold on;
plot(time,denied_pos_error(:,3),'LineWidth',2,'Color',color6)
plot(time,vair_pos_error(:,3),'LineWidth',2,'Color',color3)
plot(time,ESEKFM1_pos_error(:,3),'LineWidth',2,'Color',color4)



ylabel('$$\delta v_D\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);
%% poserr22
% time = out.Nav.ES_EKFNav_M1.GNSS_enable_flag.Time;

h = figure(Name='pos')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);
subplot1 = subplot(3,1,1)
gpspos_N = out.Nav.GPS1_noerr.gpspos_N.Data;

% ESEKF_uwb_pos_error(:,1) = abs(gpspos_N - out_slave_uwb.ESEKF_PNED.signals(1).values);
denied_pos_error(:,1) = (gpspos_N - out_slave_denied_80.RIEKF_PNED.signals(1).values);
vair_pos_error(:,1) = (gpspos_N - out_slave_vair_80.RIEKF_PNED.signals(1).values);
ESEKFM1_pos_error(:,1) = (gpspos_N - out_slave_uwb.RIEKF_PNED.signals(1).values);


hold on;
% plot(time,ESEKF_uwb_pos_error(:,1),'LineWidth',2,'Color',color6)
hold on;
plot(time,denied_pos_error(:,1),'LineWidth',2,'Color',color6)
plot(time,vair_pos_error(:,1),'LineWidth',2,'Color',color3)
plot(time,ESEKFM1_pos_error(:,1),'LineWidth',2,'Color',color4)


ylabel('$$\delta v_N\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,2)
gpspos_E = out.Nav.GPS1_noerr.gpspos_E.Data ;

% ESEKF_uwb_pos_error(:,2) = abs(gpspos_E - out_slave_uwb.ESEKF_PNED.signals(2).values);
denied_pos_error(:,2) = (gpspos_E - out_slave_denied_80.RIEKF_PNED.signals(2).values);
vair_pos_error(:,2) = (gpspos_E - out_slave_vair_80.RIEKF_PNED.signals(2).values);
ESEKFM1_pos_error(:,2) = (gpspos_E - out_slave_uwb.RIEKF_PNED.signals(2).values);


hold on;
plot(time,ESEKF_uwb_pos_error(:,2),'LineWidth',2,'Color',color6)
hold on;
plot(time,denied_pos_error(:,2),'LineWidth',2,'Color',color6)
plot(time,vair_pos_error(:,2),'LineWidth',2,'Color',color3)
plot(time,ESEKFM1_pos_error(:,2),'LineWidth',2,'Color',color4)
ylabel('$$\delta v_E\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(3,1,3)
gpspos_D = (out.Nav.GPS1_noerr.gpspos_D.Data + out.Nav.SensorData2.pos_D_gps.Data)./2;

% ESEKF_uwb_pos_error(:,3) = abs(gpspos_D - out_slave_uwb.ESEKF_PNED.signals(3).values);
denied_pos_error(:,3) = abs(gpspos_D - out_slave_denied_80.RIEKF_PNED.signals(3).values);
vair_pos_error(:,3) = abs(gpspos_D - out_slave_vair_80.RIEKF_PNED.signals(3).values);
ESEKFM1_pos_error(:,3) = abs(gpspos_D - out_slave_uwb.RIEKF_PNED.signals(3).values);


hold on;
plot(time,ESEKF_uwb_pos_error(:,3),'LineWidth',2,'Color',color6)
hold on;
plot(time,denied_pos_error(:,3),'LineWidth',2,'Color',color6)
plot(time,vair_pos_error(:,3),'LineWidth',2,'Color',color3)
plot(time,ESEKFM1_pos_error(:,3),'LineWidth',2,'Color',color4)



ylabel('$$\delta v_D\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);
%% Vwind

time = out.Nav.ES_EKFNav_M1.GNSS_enable_flag.Time;

h = figure(Name='pos')
% set(h, 'Position', [2735,241.6666666666667,728,544.6666666666666]);

subplot1 = subplot(4,1,1)

plot(time,Vwind0.signals.values(:,1),'LineWidth',2,'Color',color6)
hold on;
plot(time,Vwind.signals.values(:,1),'LineWidth',2,'Color',color3)
plot(time,Vwind_ref.signals.values(:,1),'LineWidth',2,'Color',color4)


ylabel('$$\delta v_N\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(4,1,2)
plot(time,Vwind0.signals.values(:,2),'LineWidth',2,'Color',color6)
hold on;
plot(time,Vwind.signals.values(:,2),'LineWidth',2,'Color',color3)
plot(time,Vwind_ref.signals.values(:,2),'LineWidth',2,'Color',color4)

ylabel('$$\delta v_E\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);

subplot1 = subplot(4,1,3)

plot(time,Vwind0.signals.values(:,3),'LineWidth',2,'Color',color6)
hold on;
plot(time,Vwind.signals.values(:,3),'LineWidth',2,'Color',color3)
plot(time,Vwind_ref.signals.values(:,3),'LineWidth',2,'Color',color4)

ylabel('$$\delta v_D\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);


subplot1 = subplot(4,1,4)

plot(time,sqrt(Vwind0.signals.values(:,1).^2+Vwind0.signals.values(:,2).^2+Vwind0.signals.values(:,3).^2),'LineWidth',2,'Color',color6)
hold on;
plot(time,sqrt(Vwind.signals.values(:,1).^2+Vwind.signals.values(:,2).^2+Vwind.signals.values(:,3).^2),'LineWidth',2,'Color',color3)
plot(time,sqrt(Vwind_ref.signals.values(:,1).^2+Vwind_ref.signals.values(:,2).^2+Vwind_ref.signals.values(:,3).^2),'LineWidth',2,'Color',color6)

ylabel('$$\delta v_D\,$$[m/s]','FontSize',12,'FontName','Times','Interpreter','latex');
xlabel('time [s]','FontSize',12,'FontName','Times','Interpreter','latex');
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'off');
set(subplot1,'FontName','Times','GridLineStyle',...
    '--','LineWidth',0.8,'XMinorTick','on','YMinorTick','on','ZMinorTick','on');
legend({'IMM-RIEKF','RIEKF M1','RIEKF M2','ESEKF M1'},'NumColumns',5,'Location','north','FontSize',10,'Interpreter','latex');
legend('boxoff');
set(gca,'FontSize',12);



zp = BaseZoom();
zp.run();