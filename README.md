# VB-RIEKF-for-cooperative-navigation-MATLAB
This project involves the VB-RIEKF code for formation cooperative navigation. Due to data confidentiality, only the code can be made public. The user only needs to replace the corresponding interface to start using it.

Authors:Fujun Song,Qinghua Zeng; Rui Zhang; Xiaohu Zhu; Zongyu Zhang and Xiaoyu Ye

# MATLAB version
MATLAB 2023a


# RUN
Run VB_RIFKF_GNSS/UWB_INS25.slx and VB_RI_EKF_GNSS_INS25.slx



# Code Description:

1. VB_RIFKF_GNSS/UWB_INS25.slx implements the federated RIEKF architecture based on Variational Bayesian (VB) estimation.
2. VB_RI_EKF_GNSS_INS25.slx is used to compare the VB-based RIEKF with the conventional RIEKF.

# Data Description:

1. The file matlab_VB_comparsion.mat contains the datasets ESEKFM1, RIEKFM2, and RIEKFM1, which correspond to VB-ESEKF, RIEKF, and VB-RIEKF, respectively.
2. The files matlab_VBFKF_addnoise.mat, matlab_FKF_addnoise.mat, and matlab_ISF_addnoise.mat contain the results of the VB-based federated RIEKF architecture, the traditional federated EKF architecture, and the ISF-based federated RIEKF architecture, respectively.
3. lstm_test.mat contains the trained LSTM network results for lstm_test.

---

若您需要，我也可以帮您将这段内容进一步润色成可直接放入 README 或补充材料的正式说明文本。
