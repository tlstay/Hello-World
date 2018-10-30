% load('TTdata 180326.xlsx') ;
% WT = [] ; L7 = [] ; Lobule = {} ; Colors = [] ;
% pause ;                                 % Load Excel data in variables.

% % Putative vs control data
% figure; hold on ;
% % Stats = [] ; genotype = [] ; PC = [] ;
% putativeFig = plot(Stats(genotype==0&PC==0,1),Stats(genotype==0&PC==0,3),'o',...
%     'markerfacecolor',[0.6 0.2 0.2],'markeredgecolor',[0.85 0.325 0.01],'markersize',8) ;
% plot(Stats(genotype==0&PC==1,1),Stats(genotype==0&PC==1,3),'p',...
%     'markerfacecolor',[0.6 0.2 0.2],'markeredgecolor',[0.4 0.4 0.6],'markersize',8,'linewidth',1) ;
% plot(Stats(genotype==1&PC==0,1),Stats(genotype==1&PC==0,3),'o',...
%     'color',[0.6 0.2 0.2],'markersize',8,'linewidth',2) ;
% plot(Stats(genotype==1&PC==1,1),Stats(genotype==1&PC==1,3),'p',...
%     'color',[0.4 0.4 0.6],'markersize',8,'linewidth',1.5) ;

% Lobule data
figure;
subplot(3,3,[2 3 5 6])
Sfig = scatter(WT(:,1),WT(:,3),50,Colors(1:length(WT),:),'filled') ;
hold on ;
scatter(L7(:,1),L7(:,3),50,Colors(length(WT)+1:end,:),'linewidth',2) ;

Plot_Enhance(Sfig)
xlabel('Firing Rate')
ylabel('CV2')

Hfig1 = subplot(3,3,[1 4]) ;
[CV2num(:,1),pos] = histc(WT(:,3),[0.1:0.1:0.9]) ;
hWT1 = bar([0.15:0.1:0.95],CV2num(:,1),'faceColor','k') ;
set(gca,'view',[90 -90]); 
hold on ;
[CV2num(:,2),pos] = histc(L7(:,3),[0.1:0.1:0.9]) ;
hL71 = bar([0.15:0.1:0.95],CV2num(:,2),'faceColor','w') ;
plot(Hfig1,mean(WT(:,3)),(max(max(CV2num))+1),'k>','markerfacecolor','k')
plot(Hfig1,mean(L7(:,3)),(max(max(CV2num))+1),'k>','markerfacecolor','w')
set(Hfig1,'ydir','reverse','ytick',[0 10 20 30 40], 'box','off',...
    'xlim',[0.1 0.9],'xcolor',[1 1 1],'xtick',[],'xticklabel',[]) ;
Plot_Enhance(gcf)
% xlim([0.1 0.9])

Hfig2 = subplot(3,3,[8:9]) ;
[HZnum(:,1),pos] = histc(WT(:,1),[0:10:130]) ;
hWT2 = bar([05:10:135],HZnum(:,1),'faceColor','k') ;
hold on ;
[HZnum(:,2),pos] = histc(L7(:,1),[0:10:130]) ;
hL72 = bar([05:10:135],HZnum(:,2),'faceColor','w') ;
plot(Hfig2,mean(WT(:,1)),(max(max(HZnum))+1),'k^','markerfacecolor','k')
plot(Hfig2,mean(L7(:,1)),(max(max(HZnum))+1),'k^','markerfacecolor','w')
set(Hfig2,'ydir','reverse','box','off',...
    'xlim',[0 140],'xcolor',[1 1 1],'xtick',[],'xticklabel',[]) ;
Plot_Enhance(gcf)

print -painters -depsc -r300 Figure4a.eps
print -painters -dpdf -r300 Figure4a.pdf
% xlim([0 140])
% set(gca,'xtick',[0:10:140]) ;

% Sfig = scatter(WT(:,1),WT(:,3),50,cell2mat(Lobule(1:length(WT))),'filled') ;
% hold on ;
% scatter(L7(:,1),L7(:,3),50,cell2mat(Lobule(length(WT)+1:end)),'linewidth',2) ;

% Lobule(find(strcmp(Lobule,'V'),1),1:3) = {0.9 0.6 0} ;
% Lobule(find(strcmp(Lobule,'VI'),1),1:3) = {0.9 0.6 0} ;
% Lobule(find(strcmp(Lobule,'VII'),1),1:3) = {0.9 0.6 0} ;
% Lobule(find(strcmp(Lobule,'Ant VIII'),1),1:3) = {0.95 0.9 0.25} ;
% Lobule(find(strcmp(Lobule,'Ant IX'),1),1:3) = {0.95 0.9 0.25} ;
% Lobule(find(strcmp(Lobule,'IX'),1),1:3) = {0.35 0.7 0.9} ;
% Lobule(find(strcmp(Lobule,'X'),1),1:3) = {0 0.45 0.7} ;
% Lobule(find(strcmp(Lobule,'IXa'),1),1:3) = {0 0 0} ;

% for i = 1:length(Lobule)
%     if strcmp(Lobule(i),'V')
%         Lobule(i,1:3) = {0.9 0.6 0} ;
%     elseif strcmp(Lobule(i),'VI')
%         Lobule(i,1:3) = {0.9 0.6 0} ;
%     elseif strcmp(Lobule(i),'VII')
%         Lobule(i,1:3) = {0.9 0.6 0} ;
%     elseif strcmp(Lobule(i),'Ant VIII')
%         Lobule(i,1:3) = {0.95 0.9 0.25} ;
%     elseif strcmp(Lobule(i),'Ant IX')
%         Lobule(i,1:3) = {0.95 0.9 0.25} ;
%     elseif strcmp(Lobule(i),'IX')
%         Lobule(i,1:3) = {0.35 0.7 0.9} ;
%     elseif strcmp(Lobule(i),'X')
%         Lobule(i,1:3) = {0 0.45 0.7} ;
%     elseif strcmp(Lobule(i),'IXa')
%         Lobule(i,1:3) = {0 0 0} ;
%     end
% end