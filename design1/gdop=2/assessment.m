clear all;
clc;
design=1;
noise = 0.3;
gdop = 2;
R=5;
f=2.4;
%load(['output_',num2str(f),'GHz/design1_noise=',num2str(noise),'_gdop=',num2str(gdop),'_R=',num2str(R),'.mat'])
load(['output_',num2str(f),'GHz/design1_noise=',num2str(noise),'_gdop=',num2str(gdop),'.mat'])

load(['noise=',num2str(noise),'/R=',num2str(R),'_gdop=',num2str(gdop),'_noise=',num2str(noise),'_ga_output.mat'])


% Sorting the resulting function values based on beacon count -> column 1
f = sortrows(fval_ga,1); 


sol_count = f(:,1);    % Beacon counts for pareto front 
sol_density = -f(:,2);  % Beacon density for pareto front
sol_coverage = final_solve_mat(:,1,R-2);   % Coverage for the configuration resulting from R
sol_error = final_error_mat(:,1,R-2);   % RMSE for the configuration resulting from R


% normalizing the data into (0,1)
norm_count = ((sol_count-max(sol_count))/(max(sol_count)-min(sol_count)))+2;
norm_density = ((sol_density-max(sol_density))/(max(sol_density)-min(sol_density)))+2;
norm_coverage = ((sol_coverage-max(sol_coverage))/(max(sol_coverage)-min(sol_coverage)))+2;
norm_error = ((sol_error-max(sol_error))/(max(sol_error)-min(sol_error)))+2;


expectation = norm_density./(norm_count);
performance = norm_coverage./(norm_error);


norm_expec = ((length(sol_count)-1)/(min(expectation)-max(expectation)))*(expectation-max(expectation))+1;
norm_perf = ((length(sol_count)-1)/(min(performance)-max(performance)))*(performance-max(performance))+1;

verdict = norm_expec.*norm_perf;
norm_verdict = ((length(sol_count)-1)/(max(verdict)-min(verdict)))*(verdict-min(verdict))+1;

cost_thresh = max(sol_count);

thresh_index = sum((sol_count)<=cost_thresh);

trim_count=sol_count(1:thresh_index);
trim_density=sol_density(1:thresh_index);
trim_coverage=sol_coverage(1:thresh_index);
trim_error=sol_error(1:thresh_index);

trim_verdict = norm_verdict(1:thresh_index);

final=find(trim_verdict==min(trim_verdict));
fprintf('----- Winner -----\nDesign\t|g\t|R\t|N\t|count\t|density\t|coverage%%\t|error\n');
fprintf('\n%d\t%d\t%d\t%d\t%.0f\t%f\t%f\t%f\n',design,gdop,R,noise*100,sol_count(final),sol_density(final),sol_coverage(final),sol_error(final));
fprintf('\n%d\t%d\t%d\t%d\t%.0f\t%f\t%f\t%f\n',...
design,gdop,R,noise*100,f(1),-f(2),final_solve_mat(1),final_error_mat(1));




%verdict = performance.*rank ;
%figure

% plot(sol_count,norm_count,'-+');
% hold on
% plot(sol_count,norm_density,'--o');
% hold on
% plot(sol_count,norm_expec,'-.^');
% hold on
% plot(sol_count,norm_perf,'-.^');
% hold on
% plot(sol_count,norm_verdict,'-.^');
%text(sol_count,norm_verdict,norm_verdict);

% legend('expectation','performance','verdict')
% grid minor

%legend('count','density','normalized rank');
% 
% 
% figure
% plot(sol_count,rank,'-+');
% hold on
% plot(sol_count,performance,'-o')
% hold on
% plot(sol_count,verdict,'--^')
% 
% xlabel('Beacon Count');
% ylabel('Normalized Value (1,2)');
% legend('rank','performance','verdict');
% grid on
% xlim([min(sol_count)-1 30]);
% xticks(min(sol_count)-1:30)

%Finding solutions within threshold


%  xlim([min(sol_count)-1 cost_thresh]);
% ax = gca;
%  ax.XTick=min(sol_count)-1:cost_thresh;





























%noise = [10 20];
% c=0;
% figure
% for k=1:length(noise)
% load(['design1_noise=',num2str(noise(k)/100),'_gdop=1.mat'])
% c=c+1;
% figure
% subplot(2,2,c)
% for i=1:3
% plot(final_error_mat(:,2,i),final_error_mat(:,1,i),'o');
% hold on
% end
% xlabel('Beacon Count')
% ylabel('Average Positioning Error');
% legend('R=3','R=4','R=5','Location','east');
% grid on
% grid minor
% title(['% Noise = ',num2str(noise(k))])
% 
% c=c+1;
% subplot(2,2,c)
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



















