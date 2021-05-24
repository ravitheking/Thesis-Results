noise = [10 20];
c=0;
figure
for k=1:length(noise)
load(['design1_noise=',num2str(noise(k)/100),'_gdop=1.mat'])
c=c+1;
%figure
subplot(2,2,c)
for i=1:3
plot(final_error_mat(:,2,i),final_error_mat(:,1,i),'o');
hold on
end
xlabel('Beacon Count')
ylabel('Average Positioning Error');
legend('R=3','R=4','R=5','Location','east');
grid on
grid minor
title(['% Noise = ',num2str(noise(k))])

c=c+1;
subplot(2,2,c)
for i=1:3
plot(final_solve_mat(:,2,i),final_solve_mat(:,1,i),'^');
hold on
end
xlabel('Beacon Count');
ylabel('% Localization');
legend('R=3','R=4','R=5','Location','east');

grid on
grid minor
title(['% Noise = ',num2str(noise(k))])
end























%============= For separate File =============
% clear all;
% clc;
% noise = [10 20];
% c=0;
% figure
% for k=1:length(noise)
% c=c+1;
% subplot(2,2,c)
% 
% if(k==2)
% load(['design1_noise=',num2str(noise(k)/100),'_R=3_gdop=1.mat'])
% plot(final_error_mat(:,2),final_error_mat(:,1),'o');
% hold on
% 
% load(['design1_noise=',num2str(noise(k)/100),'_gdop=1.mat'])
% %figure
% for i=1:2
% plot(final_error_mat(:,2,i),final_error_mat(:,1,i),'o');
% hold on
% end
% xlabel('Beacon Count')
% ylabel('RMSE');
% legend('R=3','R=4','R=5','Location','east');
% grid on
% grid minor
% title(['% Noise = ',num2str(noise(k))])
% else
% load(['design1_noise=',num2str(noise(k)/100),'_gdop=1.mat'])
% for i=1:3
% plot(final_error_mat(:,2,i),final_error_mat(:,1,i),'o');
% hold on
% end
% xlabel('Beacon Count')
% ylabel('RMSE');
% legend('R=3','R=4','R=5','Location','east');
% grid on
% grid minor
% title(['% Noise = ',num2str(noise(k))])    
% end
% 
% 
% 
% c=c+1;
% subplot(2,2,c)
% if(k==2)
% load(['design1_noise=',num2str(noise(k)/100),'_R=3_gdop=1.mat'])
% plot(final_solve_mat(:,2),final_solve_mat(:,1),'^');
% hold on
% load(['design1_noise=',num2str(noise(k)/100),'_gdop=1.mat'])
% for i=1:2
% plot(final_solve_mat(:,2,i),final_solve_mat(:,1,i),'^');
% hold on
% end
% xlabel('Beacon Count');
% ylabel('% Localization');
% legend('R=3','R=4','R=5','Location','east');
% 
% grid on
% grid minor
% title(['% Noise = ',num2str(noise(k))])
% else
% for i=1:3
% plot(final_solve_mat(:,2,i),final_solve_mat(:,1,i),'^');
% hold on
% end
% xlabel('Beacon Count');
% ylabel('% Localization');
% legend('R=3','R=4','R=5','Location','east');
% 
% grid on
% grid minor
% title(['% Noise = ',num2str(noise(k))])
% end
% end
