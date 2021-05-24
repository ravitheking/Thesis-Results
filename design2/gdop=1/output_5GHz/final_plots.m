noise = [30]; % for 10 and 30 percent
c=0;
figure

for k=1:length(noise)
sgtitle(['Noise=',num2str(noise(k)),'%'],'FontSize',13)
load(['design3_noise=',num2str(noise(k)/100),'_gdop=1.mat'])
c=c+1;
subplot(length(noise),2,c)
for i=1:3
plot(final_error_mat(:,2,i),final_error_mat(:,1,i),'o');
hold on
end
xlabel('Beacon Count')
ylabel('RMSE');
legend('R=3','R=4','R=5','Location','east');
grid on
grid minor
%title(['% Noise = ',num2str(noise(k))])
set(gca, 'FontSize', 13) 
xlim([0,110])
ylim([0.5,4])
xticks([0:10:110])
yticks([0:0.5:4])


c=c+1;
subplot(length(noise),2,c)
for i=1:3
plot(final_solve_mat(:,2,i),final_solve_mat(:,1,i),'^');
hold on
end
xlabel('Beacon Count');
ylabel('% Localization');
legend('R=3','R=4','R=5','Location','east');

grid on
grid minor
%title(['% Noise = ',num2str(noise(k))])
set(gca, 'FontSize', 13) 
xlim([0,110])
ylim([60 100])
xticks([0:10:110])
yticks([60:5:100])

end

