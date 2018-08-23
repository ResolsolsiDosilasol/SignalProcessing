function NegExpSig = NegExpSigGen( vmax, Ts, tao, zN, N, noise_value )
%  input: vmax        ����ֵ
%         Ts          ��������
%         tao         ˥��ʱ�䳣��
%         zN          0���г���
%         N           �����ܳ���
%         noise_value �Ƿ�����������ţ�1��Yes; 0��No��
%
% output: NegExpSig   ��ָ���źţ�����or���룩

% 0����
for i = 1:1:(zN-1)
    neg_(i) = 0;
end

% ��ָ������
for i = zN:1:N
    neg_e(i) = vmax * exp(-(i-zN) * Ts / tao);
end

% �����������
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

