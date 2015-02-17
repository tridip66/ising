% This program plots all the magnetization data for Ising model for
% iteration vs magnetization for each temperature
clear all;
clc;
fileID = fopen('Magnetization.out');
%
header = textscan(fileID,'%s',3);
datain = textscan(fileID,'%f %d %f',16000);
fclose(fileID);
%
%plot_mag = zeros(1:100);
%X = zeros(1:100);
Magnetization = datain{3};
for j = 1:16
    for i = 1:1000
        plot_mag(i,j)= Magnetization((j-1)*i+1);
        X(i) = i*1000;
    end
end
plot(X,plot_mag(:,1),X,plot_mag(:,6),X,plot_mag(:,8),X,plot_mag(:,11),X,plot_mag(:,16))
grid on
xlabel('# of iterations')
ylabel('|magnetization|')
legend('T=1.0','T=2.0','T=2.4','T=3.0','T=4.0')
set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [5 5]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'magnetization', 'pdf') %Save figure