代码解释：
1.VB_RIFKF_GNSS/UWB_INS25.slx模型主要是基于VB的联邦RIKEF架构
2.VB_RI_EKF_GNSS_INS25.slx则是基于VB的RIEKF与RIEKF对比
数据解释：
1.matlab_VB_comparsion.mat内部数据有ESEKFM1/RIEKFM2/RIEKFM1分别代表VB-ESEKF/RIEKF/VB-RIEKF
2.matlab_VBFKF_addnoise.mat/matlab_FKF_addnoise.mat/matlab_ISF_addnoise.mat中基于VB的联邦RIKEF架构、传统的联邦EKF架构、基于ISF的联邦RIKEF架构的结果
3.lstm_test.mat是lstm_test训练的网络结果，