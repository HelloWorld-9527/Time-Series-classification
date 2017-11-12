% 找出 imf 然后 输入到对应的文件中。
clc
clear all
close all

TRAIN = load('E:\MATLAB-project\TimeSeries\data\UCR_TS_Archive_2015\wafer\wafer_TRAIN');
TEST  = load('E:\MATLAB-project\TimeSeries\data\UCR_TS_Archive_2015\wafer\wafer_TEST' );

TRAIN_class_labels = TRAIN(:,1); % Pull out the class labels.
TRAIN(:,1) = [];                 % Remove class labels from training set.

x = TRAIN(1,:);
imf = emd(x); % 找出了 这条instance的 多条IMF以及最后的残差

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%现在是需要将其写入文件
%%格式分别是 raw_data/n IMF1/n IMF/2/n ,...,res

%%% 这里有一个问题，就是 构造完了之后，每条instance的列数不一样。 怎么样读取为instance输入到 AE



