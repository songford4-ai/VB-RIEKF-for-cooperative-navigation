function filtered_data = lowpass_filter_simple(data, cutoff_freq, sampling_rate)
    % data: 输入的数据数组
    % cutoff_freq: 截止频率
    % sampling_rate: 采样率

    % 计算归一化截止频率
    norm_cutoff_freq = cutoff_freq / (sampling_rate / 2);

    % 设计滤波器系数
    [b, a] = butter(1, norm_cutoff_freq, 'low');

    % 应用滤波器
    filtered_data = filter(b, a, data);
end
