function vo = SKfilter( vi, zN, N, k )
%  input: vi 输入信号（待成形信号）
%         k  RC
%         zN 0序列长度
%         N  序列总长度
% output: vo 输出信号（高斯成形后的信号）

vo(1:zN+1)= [zeros(1, zN+1)];
for i = zN+2:1:N
    vo(i) = ((k + 2 * k .^ 2) * vo(i-1) - k .^ 2 * vo(i-2) + 2 * vi(i)) / (1 + k + k .^ 2);
end
vo = vo;
end

