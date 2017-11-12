function imf = emd(x)
% Empiricial Mode Decomposition (Hilbert-Huang Transform)
% EMD分解或HHT变换
% 返回值为cell类型，依次为一次IMF、二次IMF、...、最后残差
x   = transpose(x(:));
imf = [];
while ~ismonotonic(x)
    x1 = x;
    sd = Inf;
    while (sd > 0.1) || ~isimf(x1)
        s1 = getspline(x1);         % 极大值点样条曲线
        s2 = -getspline(-x1);       % 极小值点样条曲线
        x2 = x1-(s1+s2)/2;
       
        sd = sum((x1-x2).^2)/sum(x1.^2);
        x1 = x2;
    end
   
    imf{end+1} = x1;
    x          = x-x1;
end
imf{end+1} = x;


