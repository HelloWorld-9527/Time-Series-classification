% 找出 imf 然后 输入到对应的文件中。
clc
clear all
close all

TRAIN = load('F:\Matlab_project\UCR_TS_Archive_2015\wafer\wafer_TRAIN');
TEST  = load('F:\Matlab_project\UCR_TS_Archive_2015\wafer\wafer_TEST' );

TRAIN_class_labels = TRAIN(:,1); % Pull out the class labels.
TRAIN(:,1) = [];                 % Remove class labels from training set.


x = TRAIN(1,:);
imf = eemd(x,0.1,50); % 找出了 这条instance的 多条IMF以及最后的残差
imf = imf'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%现在是需要将其写入文件
%%格式分别是 raw_data/n IMF1/n IMF2/n ,...,res/n

%%% 这里有一个问题，就是 构造完了之后，每条instance的列数不知道是不是一样的。待会看看就知道了
%%% 经过我的学习理解，这里的 m = fix(log2 N)-1,所以是固定的了。 fix() 取整函数
%%% fix(log2(152))-1   ans = 6  表示 6条IMF，另外 还有 1 res， 1 raw data 共8条， 没毛病。

% 接下来是写文件

csvwrite('output',imf);





