%%
%导入数据
repu=table2array(reputation);
%2，3次多项式拟合，误差都小于0.001*10^(-4)
[p1,err1]=poly(repu(:,1),repu(:,3),2);
[p2,err2]=poly(repu(:,1),repu(:,3),3);

%%
%tanh  sigmoid  (kx-a)^0.5通过cftool实现
X=repu(:,1);
YA=repu(:,2);
YB=repu(:,3);
YC=repu(:,4);

%%
%2，3次多项式拟合函数
function [p,err]=poly(x,y,n)%输入原始数据x,y，多项式次数n;返回降幂系数p,平方误差err
    [p,S] = polyfit(x,y,n);%进行n次多项式拟合
    [y_fit,delta] = polyval(p,x,S);%进行误差范围下估计值的计算，delta是误差绝对值向量
    err=mean(delta.^2);%计算平方误差
    plot(x,y,'bo')%画出原始图和估计图
    hold on
    plot(x,y_fit,'r-')
    plot(x,y_fit+2*delta,'m--',x,y_fit-2*delta,'m--')
    title('Linear Fit of Data with 95% Prediction Interval')
    legend('Data','Linear Fit','95% Prediction Interval')
    hold off
end