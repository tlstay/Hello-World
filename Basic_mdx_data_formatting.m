function [SSstats, CSstats] = Basic_mdx_data_formatting(MUT)

tmp = struct2cell(MUT.PC.SS) ;
SSstats = cell2mat(tmp(3:size(tmp,1))) ;
tmp = struct2cell(MUT.PC.CS) ;
CSstats = cell2mat(tmp(3:size(tmp,1))) ;

scatter(CSstats(22:42,5),CSstats(22:42,1),'b')
scatter(CSstats(1:21,5),CSstats(1:21,1),'r')

% CSstats = test;
zoomII(1,1) = mean(CSstats(22:42,5));
zoomII(2,1) = std(CSstats(22:42,5));
zoomII(3,1) = std(CSstats(22:42,5))/sqrt(21);
zoomII(3,2) = std(CSstats(1:21,5))/sqrt(21);
zoomII(2,2) = std(CSstats(1:21,5));
zoomII(1,2) = mean(CSstats(1:21,5));
zoomII(5,1) = mean(CSstats(22:42,1));
zoomII(6,1) = std(CSstats(22:42,1));
zoomII(7,1) = std(CSstats(22:42,1))/sqrt(21);
zoomII(7,2) = std(CSstats(1:21,1))/sqrt(21);
zoomII(6,2) = std(CSstats(1:21,1));
zoomII(5,2) = mean(CSstats(1:21,1));

plot([zoomII(5,1)-zoomII(7,1) zoomII(5,1)+zoomII(7,1)],[zoomII(1,1) zoomII(1,1)],'b','linewidth',2)
plot([zoomII(5,1) zoomII(5,1)],[zoomII(1,1)-zoomII(3,1) zoomII(1,1)+zoomII(3,1)],'b','linewidth',2)
plot([zoomII(5,2) zoomII(5,2)],[zoomII(1,2)-zoomII(3,2) zoomII(1,2)+zoomII(3,2)],'r','linewidth',2)
plot([zoomII(5,2)-zoomII(7,2) zoomII(5,2)+zoomII(7,2)],[zoomII(1,2) zoomII(1,2)],'r','linewidth',2)

plot([zoomII(1,1) zoomII(1,1)],[zoomII(5,1)-zoomII(7,1) zoomII(5,1)+zoomII(7,1)],'b','linewidth',2)
plot([zoomII(1,1)-zoomII(3,1) zoomII(1,1)+zoomII(3,1)],[zoomII(5,1) zoomII(5,1)],'b','linewidth',2)
plot([zoomII(1,2)-zoomII(3,2) zoomII(1,2)+zoomII(3,2)],[zoomII(5,2) zoomII(5,2)],'r','linewidth',2)
plot([zoomII(1,2) zoomII(1,2)],[zoomII(5,2)-zoomII(7,2) zoomII(5,2)+zoomII(7,2)],'r','linewidth',2)

end
%% Old below, eliminate (as of 09/20/18)
% load('Sept3.mat') ;
% num2clip(M2a.PC.SS.HZmedian)
% num2clip(M2a.PC.SS.HZmean)
% num2clip(M2a.PC.SS.HZmean);
% num2clip(M2a.PC.SS.HZmedian);
% num2clip(M2a.PC.SS.HZmean);
% num2clip(M2a.PC.SS.CVmean);
% num2clip(M2b.PC.SS.CVmean);
% num2clip(M2b.PC.SS.HZmean);
% num2clip(M2b.PC.SS.HZmedian);
% num2clip(M2c.PC.SS.HZmedian);
% num2clip(M2c.PC.SS.HZmean);
% num2clip(M2c.PC.SS.CVmean);
% num2clip(M2d.PC.SS.CVmean);
% num2clip(M2d.PC.SS.HZmean);
% num2clip(M2d.PC.SS.HZmedian);
% num2clip(M2e.PC.SS.HZmedian);
% num2clip(M2e.PC.SS.HZmean);
% num2clip(M2e.PC.SS.CVmean);
% num2clip(M3a.PC.SS.CVmean);
% num2clip(M3a.PC.SS.HZmean);
% num2clip(M3a.PC.SS.HZmedian);
% num2clip(Ma.PC.SS.HZmedian);
% num2clip(Ma.PC.SS.HZmean);
% num2clip(Ma.PC.SS.CVmean);
% num2clip(Mb.PC.SS.CVmean);
% num2clip(Mb.PC.SS.HZmean);
% num2clip(Mb.PC.SS.HZmedian);
% num2clip(Mc.PC.SS.HZmedian);
% num2clip(Mc.PC.SS.HZmean);
% num2clip(Mc.PC.SS.CVmean);
% num2clip(Md.PC.SS.CVmean);
% num2clip(Md.PC.SS.HZmean);
% num2clip(Md.PC.SS.HZmedian);
% num2clip(Wa.PC.SS.HZmedian);
% num2clip(Wa.PC.SS.HZmean);
% num2clip(Wa.PC.SS.CVmean);
% num2clip(Wb.PC.SS.CVmean);
% num2clip(Wb.PC.SS.HZmean);
% num2clip(Wb.PC.SS.HZmedian);
% num2clip(Wc.PC.SS.HZmedian);
% num2clip(Wc.PC.SS.HZmean);
% num2clip(Wc.PC.SS.CVmean);
% num2clip(Wd.PC.SS.CVmean);
% num2clip(Wd.PC.SS.HZmean);
% num2clip(Wd.PC.SS.HZmedian);
% num2clip(We.PC.SS.HZmedian);
% num2clip(We.PC.SS.HZmean);
% num2clip(We.PC.SS.CVmean);
% num2clip(W2a.PC.SS.CVmean);
% num2clip(W2a.PC.SS.HZmean);
% num2clip(W2a.PC.SS.HZmedian);
% num2clip(W2b.PC.SS.HZmedian);
% num2clip(W2b.PC.SS.HZmean);
% num2clip(W2b.PC.SS.CVmean);
% 
% num2clip(M2a.PC.CS.HZmedian)
% num2clip(M2a.PC.CS.HZmean)
% num2clip(M2a.PC.CS.HZmean);
% num2clip(M2a.PC.CS.HZmedian);
% num2clip(M2a.PC.CS.HZmean);
% num2clip(M2a.PC.CS.CVmean);
% num2clip(M2b.PC.CS.CVmean);
% num2clip(M2b.PC.CS.HZmean);
% num2clip(M2b.PC.CS.HZmedian);
% num2clip(M2c.PC.CS.HZmedian);
% num2clip(M2c.PC.CS.HZmean);
% num2clip(M2c.PC.CS.CVmean);
% num2clip(M2d.PC.CS.CVmean);
% num2clip(M2d.PC.CS.HZmean);
% num2clip(M2d.PC.CS.HZmedian);
% num2clip(M2e.PC.CS.HZmedian);
% num2clip(M2e.PC.CS.HZmean);
% num2clip(M2e.PC.CS.CVmean);
% num2clip(M3a.PC.CS.CVmean);
% num2clip(M3a.PC.CS.HZmean);
% num2clip(M3a.PC.CS.HZmedian);
% num2clip(Ma.PC.CS.HZmedian);
% num2clip(Ma.PC.CS.HZmean);
% num2clip(Ma.PC.CS.CVmean);
% num2clip(Mb.PC.CS.CVmean);
% num2clip(Mb.PC.CS.HZmean);
% num2clip(Mb.PC.CS.HZmedian);
% num2clip(Mc.PC.CS.HZmedian);
% num2clip(Mc.PC.CS.HZmean);
% num2clip(Mc.PC.CS.CVmean);
% num2clip(Md.PC.CS.CVmean);
% num2clip(Md.PC.CS.HZmean);
% num2clip(Md.PC.CS.HZmedian);
% num2clip(Wa.PC.CS.HZmedian);
% num2clip(Wa.PC.CS.HZmean);
% num2clip(Wa.PC.CS.CVmean);
% num2clip(Wb.PC.CS.CVmean);
% num2clip(Wb.PC.CS.HZmean);
% num2clip(Wb.PC.CS.HZmedian);
% num2clip(Wc.PC.CS.HZmedian);
% num2clip(Wc.PC.CS.HZmean);
% num2clip(Wc.PC.CS.CVmean);
% num2clip(Wd.PC.CS.CVmean);
% num2clip(Wd.PC.CS.HZmean);
% num2clip(Wd.PC.CS.HZmedian);
% num2clip(We.PC.CS.HZmedian);
% num2clip(We.PC.CS.HZmean);
% num2clip(We.PC.CS.CVmean);
% num2clip(W2a.PC.CS.CVmean);
% num2clip(W2a.PC.CS.HZmean);
% num2clip(W2a.PC.CS.HZmedian);
% num2clip(W2b.PC.CS.HZmedian);
% num2clip(W2b.PC.CS.HZmean);
% num2clip(W2b.PC.CS.CVmean);
% end