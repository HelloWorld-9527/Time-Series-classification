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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%现在是需要将其写入文件
%%格式分别是 raw_data/n IMF1/n IMF2/n ,...,res/n

%%% 这里有一个问题，就是 构造完了之后，每条instance的列数不知道是不是一样的。 怎么样读取为instance输入到 AE

x2 = TRAIN(2,:);
imf2 = eemd(x2,0.1,50);


