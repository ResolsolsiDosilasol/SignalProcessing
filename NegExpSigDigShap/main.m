clc;
close all;
clear all;


% 参数设置
Ts = 0.05; % 采样周期
tao = 1.5; % 衰减时间常数
nr = 50; % 梯形斜坡时间
nf = 0; % 梯形平顶宽度（为0则为三角形成形）
vmax = 100; % 最大幅值

zN = 30;
N = 500;
noise_value = 1;
k = 18;

% 生成负指数信号
vi1 = NegExpSigGen( vmax, Ts, tao, zN, N, 0 );
vi2 = NegExpSigGen( vmax, Ts, tao, zN, N, 1 ); 
% vi3 = NegExpSigGen( vmax, Ts, tao, zN, N, 0 ); 
% vi4 = NegExpSigGen( vmax, Ts, tao, zN, N, 0 ); 

% 梯形成形
vo1_tra = TraAndTriDigShaping( vi1, Ts, tao, 35, 30);
vo2_tra = TraAndTriDigShaping( vi2, Ts, tao, 35, 30);

% 三角形成形
vo1_tri = TraAndTriDigShaping( vi1, Ts, tao, nr, nf);
vo2_tri = TraAndTriDigShaping( vi2, Ts, tao, nr, nf);

% 高斯成形
vo1 = SKfilter( vi1, zN, N, k );
vo2 = SKfilter( vi2, zN, N, k );

% 计算信噪比
snr_orig = SNRcal(vi1, vi2);
snr_tra = SNRcal(vo1_tra, vo2_tra);
snr_tri = SNRcal(vo1_tri, vo2_tri);
snr_SK = SNRcal(vo1, vo2);

plot(1:N, vi1, 1:N, vo1, 250:N+249, vi2, 250:N+249, vo2, 'linewidth', 2); % 40:N+39, vi3, 60:N+59, vi4,
grid
axis([-inf inf -10 110])
legend('未叠加随机噪声干扰', '（未叠加）高斯成形信号', '叠加随机噪声干扰', '（叠加）高斯成形信号')

