function [cleaned_data] = remove_spike_with_previous_frame(data, threshold)
    % data: 输入的数据数组
    % threshold: 用于判断尖峰的阈值
    % cleaned_data: 清理后的数据数组

    % 初始化清理后的数据为原始数据
    cleaned_data = data;
    persistent t;
    if isempty(t)
        t = 0;
    end
    % 遍历数据点（从第二个点开始，因为第一个点没有前一个点可以比较）
    for i = 2:length(data)
        % 检查当前点与前一个点的差的绝对值是否超过阈值
        if abs(data(i) - data(i-1)) > threshold
            % 如果是尖峰，用前一个点的值替换
            cleaned_data(i) = t;
        else
            t =  data(i-1);
        end
        
    end
end
