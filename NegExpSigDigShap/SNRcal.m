function snr = SNRcal( l , ln )
% ��������Ⱥ�����snr = �ź�����/����������
% l : ���źţ��������źţ�
% ln: �����źţ��ɼ������źţ�

% PsΪ���źţ��������źţ���������PnΪ�����������ź� - ���źţ�������
Ps = sum((l).^2) / length(l);
Pn = sum((ln - l).^2) / length(ln - l);
snr = 10*log10(Ps / Pn);
end

