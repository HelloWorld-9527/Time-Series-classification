% 找出 imf 然后输出来。
clc
clear all
close all

TRAIN = load('E:\MATLAB-project\TimeSeries\data\UCR_TS_Archive_2015\wafer\wafer_TRAIN');
TEST  = load('E:\MATLAB-project\TimeSeries\data\UCR_TS_Archive_2015\wafer\wafer_TEST' );

TRAIN_class_labels = TRAIN(:,1); % Pull out the class labels.
TRAIN(:,1) = [];                 % Remove class labels from training set.

x = TRAIN(15,:);
imf = emd(x);

% 显示各IMF
Ts = 0.01;
M = length(imf);
N = length(x);
c = linspace(0,(N-1)*Ts,N); % 0:Ts:Ts*(N-1)
for k1 = 0:4:M-1
    figure
    for k2 = 1:min(4,M-k1)
        subplot(4,2,2*k2-1)
        plot(c,imf{k1+k2})
        set(gca,'FontSize',8,'XLim',[0 c(end)]);
        title(sprintf('第%d个IMF', k1+k2))
        xlabel('Time/s')
        ylabel(sprintf('IMF%d', k1+k2));
    end
end

figure
subplot(211)
plot(c,x)
set(gca,'FontSize',8,'XLim',[0 c(end)]);
title('原始信号')
xlabel('Time/s')
ylabel('Origin');

