%%
%��������
repu=table2array(reputation);
%2��3�ζ���ʽ��ϣ���С��0.001*10^(-4)
[p1,err1]=poly(repu(:,1),repu(:,3),2);
[p2,err2]=poly(repu(:,1),repu(:,3),3);

%%
%tanh  sigmoid  (kx-a)^0.5ͨ��cftoolʵ��
X=repu(:,1);
YA=repu(:,2);
YB=repu(:,3);
YC=repu(:,4);

%%
%2��3�ζ���ʽ��Ϻ���
function [p,err]=poly(x,y,n)%����ԭʼ����x,y������ʽ����n;���ؽ���ϵ��p,ƽ�����err
    [p,S] = polyfit(x,y,n);%����n�ζ���ʽ���
    [y_fit,delta] = polyval(p,x,S);%������Χ�¹���ֵ�ļ��㣬delta��������ֵ����
    err=mean(delta.^2);%����ƽ�����
    plot(x,y,'bo')%����ԭʼͼ�͹���ͼ
    hold on
    plot(x,y_fit,'r-')
    plot(x,y_fit+2*delta,'m--',x,y_fit-2*delta,'m--')
    title('Linear Fit of Data with 95% Prediction Interval')
    legend('Data','Linear Fit','95% Prediction Interval')
    hold off
end