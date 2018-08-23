function vo = TraAndTriDigShaping( vi, Ts, tao, nr, nf)
%  input: vi  �����źţ������εĸ�ָ���źţ�
%         Ts  ��������
%         tao ˥������
%         nr  ����б��ʱ��
%         nf  �����ϱ߿�ȣ�Ϊ0��Ϊ�����Σ�
% output: vo ����źţ����κ���źţ�����/�����Σ���

% ����/�����γ����㷨
na = round(nr);
nb = round(nr + nf);
nc = round(2 * nr + nf);
d = exp(-Ts / tao);

vout_1 = 0;
vout_2 = 0;

for i = 1:1:length(vi)
    if ((i-1)<0)||((i-1)==0)
        vout_1 = 0;
        vin_1  = 0;
    else
        vin_1  = vi(i-1);
    end
    
    if ((i-2)<0)||((i-2)==0)
        vout_2 = 0;
        vin_2  = 0;
    else
        vin_2  = vi(i-2);
    end
    
    if ((i-na-1)<0)||((i-na-1)==0)
        vin_na_1 = 0;
    else
        vin_na_1 = vi(i-na-1);
    end
    
    if ((i-nb-1)<0)||((i-nb-1)==0)
        vin_nb_1 = 0;
    else
        vin_nb_1 = vi(i-nb-1);
    end
    
    if ((i-nc-1)<0)||((i-nc-1)==0)
        vin_nc_1 = 0;
    else
        vin_nc_1 = vi(i-nc-1);
    end
    
    if ((i-na-2)<0)||((i-na-2)==0)
        vin_na_2 = 0;
    else
        vin_na_2 = vi(i-na-2);
    end
    
    if ((i-nb-2)<0)||((i-nb-2)==0)
        vin_nb_2 = 0;
    else
        vin_nb_2 = vi(i-nb-2);
    end
    
    if ((i-nc-2)<0)||((i-nc-2)==0)
        vin_nc_2 = 0;
    else
        vin_nc_2 = vi(i-nc-2);
    end
    
    vo(i) = 2 * vout_1 - vout_2 + (1/na) * ((vin_1 - vin_na_1 - vin_nb_1 + vin_nc_1) - d * (vin_2 - vin_na_2 - vin_nb_2 + vin_nc_2));
    vout_2 = vout_1;
    vout_1 = vo(i);
end   
end

