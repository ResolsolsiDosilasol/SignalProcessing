function vo = SKfilter( vi, zN, N, k )
%  input: vi �����źţ��������źţ�
%         k  RC
%         zN 0���г���
%         N  �����ܳ���
% output: vo ����źţ���˹���κ���źţ�

vo(1:zN+1)= [zeros(1, zN+1)];
for i = zN+2:1:N
    vo(i) = ((k + 2 * k .^ 2) * vo(i-1) - k .^ 2 * vo(i-2) + 2 * vi(i)) / (1 + k + k .^ 2);
end
vo = vo;
end

