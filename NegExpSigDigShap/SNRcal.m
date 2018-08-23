function snr = SNRcal( l , ln )
% 计算信噪比函数（snr = 信号能量/噪声能量）
% l : 纯信号（降噪后的信号）
% ln: 带噪信号（采集到的信号）

% Ps为纯信号（降噪后的信号）的能量；Pn为噪声（带噪信号 - 纯信号）的能量
Ps = sum((l).^2) / length(l);
Pn = sum((ln - l).^2) / length(ln - l);
snr = 10*log10(Ps / Pn);
end

