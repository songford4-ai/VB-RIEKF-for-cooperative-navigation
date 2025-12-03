dt = 0.01;      % 仿真步长设置
GPSdt = 0.1;
g0 = 9.798;
%load("magndata.mat");
load("ReduDataAll.mat");

time = 0:0.01:(size(FCS1.systime,1) - 1) * 0.01;
time = time';
%%
H_sensor_type = 1;% 值为0融合GPS高度 值为1融合TOF高度
KF_enable = 1;
CF_enable = 0;

ISUS_flag = 1;
param.proces.imu_gyro_cutoff_freq = 30;
param.fusion.magDeclDeg = -10.5;%10.5; % Magnetic declination in deg
param.control.GPSheadingCorrection = 0;
param.control.MagnheadingCorrection = 0;
%----------------------传感器误差补偿——————————————————————————%
%已转换至前右下体系 
%param.IMU.wx_bias_degps = -0.0085;
%param.IMU.wy_bias_degps = -0.3929;
%param.IMU.wz_bias_degps = -0.1066;
% param.IMU.wx_bias_degps = -0.1297;
% param.IMU.wy_bias_degps = -0.3431;
% param.IMU.wz_bias_degps = -0.1277;

% param.MAGN.x_bias_guass = -0.036703;
% param.MAGN.y_bias_guass = -0.263119;
% param.MAGN.z_bias_guass = 0.077442;
param.MAGN.x_bias_guass = -0.038703;
param.MAGN.y_bias_guass = -0.204843;
param.MAGN.z_bias_guass = 0.118248;

R0 = 6378137;                            % 地球半径
H0 = 590;                                 % 初始海拔高度，单位米
g0 = 9.795;                             % 当地重力加速度，单位米每二次方秒

% psi = -178;%156 Taj1
psi = 66.8;%148 Taj2

dtDelay = -0.03;
% psi = -27;

GNSSoutragetime = 90;
%% 参数拉偏设置
phi0_rad = 0/57.3;
gam0_rad = 0/57.3;
psi0_rad = 0/57.3;

vn0 = 0;
ve0 = 0;
vd0 = 0;

pn0 = 0;
pe0 = 0;
pd0 = 0;
%%
state_dim = 15;
cov_dim = 12;
P0 = diag([[0.1;0.1;0.5]/57.3;0.01*ones(3,1);1*ones(3,1);0.0001*ones(3,1);0.00001*ones(3,1)])^2;
% P0_RIEKF = diag([1*ones(3,1);0.01*ones(3,1);0.1*ones(3,1);0.001*ones(3,1);0.00001*ones(3,1); ...
%     0.01*ones(3,1);[0;2;2]/57.3;[0.1;0.1;0.1]])^2;
P0_RIEKF = P0;
% P0_RIEKF = diag([[1;1;5]/57.3;0.1*ones(3,1);0.2*ones(3,1);10/57.3/3600*ones(3,1); ...
%     (5*1e-3*10)*ones(3,1);0.01*ones(3,1);[0;2;2]/57.3;[0.1;0.1;0.1]])^2;
%P0 = diag([[5;5;5]/57.3;vn0*ones(3,1);pn0*ones(3,1);10/57.3/3600*ones(3,1); ...
%     (5*1e-3*10)*ones(3,1)]);

%P0_RIEKF = diag([[5;5;5]/57.3;vn0*ones(3,1);pn0*ones(3,1);10/57.3/3600*ones(3,1); ...
%    (5*1e-3*10)*ones(3,1);0.01*ones(3,1);[0;2;2]/57.3;[0.1;0.1;0.1]])^2;
%P0_RIEKF = eye(15);


state_max = [[1;1;5]/57.3;1;1;1;10;10;10;0.1;0.1;0.2;0.1;0.1;0.1];