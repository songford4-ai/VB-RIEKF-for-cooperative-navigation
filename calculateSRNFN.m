function SRNFN = calculateSRNFN(hat, o, n, M)
    % 输入参数:
    % P_hat - 预测的误差协方差矩阵，大小为 M x n x n
    % P_o   - 观测的误差协方差矩阵，大小为 M x n x n
    % R_hat - 预测的误差协方差矩阵，大小为 M x n x n
    % R_o   - 观测的误差协方差矩阵，大小为 M x n x n
    % n     - 状态向量的维度
    % M     - 样本数量

    % 初始化误差矩阵
   
   
    error_R = sqrt((hat - o).^2);

    % 计算每个样本的误差
    % for s = 1:M
        % error_R(s) = norm(hat(s, :, :) - o(s, :, :), 'fro')^2;
    % end



    % 计算SRNFN
    SRNFN = (1 / (n^2 * M) * error_R).^(1/4);
end