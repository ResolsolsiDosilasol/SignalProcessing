function NegExpSig = NegExpSigGen( vmax, Ts, tao, zN, N, noise_value )
%  input: vmax        最大幅值
%         Ts          采样周期
%         tao         衰减时间常数
%         zN          0序列长度
%         N           序列总长度
%         noise_value 是否叠加噪声干扰（1：Yes; 0：No）
%
% output: NegExpSig   负指数信号（纯净or带噪）

% 0序列
for i = 1:1:(zN-1)
    neg_(i) = 0;
end

% 负指数序列
for i = zN:1:N
    neg_e(i) = vmax * exp(-(i-zN) * Ts / tao);
end

% 叠加随机噪声
if noise_value
    noise = randn(1, N);
    noise = noise - mean(noise);
    noise = noise / std(noise);
    a = 0.5;
    b = sqrt(3);
    noise = a + b * noise;
    for i = 1:1:N
        y(i) = noise(i) + neg_e(i);
    end
    neg_e = y;
else
    neg_e = neg_e;
end

NegExpSig = neg_e;

% t = 1:t;
% NegExpSig = [zeros(1, 100), A .* exp(-t ./ tau)];
% % NegExpSig = A .* exp((20-t) ./ tau);
end

