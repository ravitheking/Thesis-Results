noise = [10 25 50];
c=0;
figure
for k=1:length(noise)
load(['design3_noise=',num2str(noise(k)/100),'_gdop=5.mat'])
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
title(['% Noise = ',num2str(noise(k))])


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
title(['% Noise = ',num2str(noise(k))])

end