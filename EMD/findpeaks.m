function n = findpeaks(x)
% Find peaks. 找极大值点，返回对应极大值点的坐标
n    = find(diff(diff(x) > 0) < 0); % 相当于找二阶导小于0的点
u    = find(x(n+1) > x(n));
n(u) = n(u)+1;                      % 加1才真正对应极大值点
% 图形解释上述过程
% figure
% subplot(611)
% x = x(1:100);
% plot(x, '-o')
% grid on
%
% subplot(612)
% plot(1.5:length(x), diff(x) > 0, '-o')
% grid on
% axis([1,length(x),-0.5,1.5])
%
% subplot(613)
% plot(2:length(x)-1, diff(diff(x) > 0), '-o')
% grid on
% axis([1,length(x),-1.5,1.5])
%
% subplot(614)
% plot(2:length(x)-1, diff(diff(x) > 0)<0, '-o')
% grid on
% axis([1,length(x),-1.5,1.5])
%
% n    = find(diff(diff(x) > 0) < 0);
% subplot(615)
% plot(n, ones(size(n)), 'o')
% grid on
% axis([1,length(x),0,2])
%
% u    = find(x(n+1) > x(n));
% n(u) = n(u)+1;
% subplot(616)
% plot(n, ones(size(n)), 'o')
% grid on
% axis([1,length(x),0,2])