% Import data
% MUT.list = dir('*mutant*.mat') ; 
clear MUT
MUT.list = dir('*.mat') ; 
MUT.list = sort_nat({MUT.list.name}) ; % Be sure to get rid of MUT(14), 7b.
for ii = 1:length(MUT.list)
    spikes2 = [] ;
    file = MUT.list(ii) ;
    load(file{1}) ;
    if ~isempty(spikes2)
        MUT.PC.SS.data(1:length(spikes1),ii) = spikes1 ;
        MUT.PC.CS.data(1:length(spikes2),ii) = spikes2 ;
    else
        MUT.NPC.data(1:length(spikes1),ii) = spikes1 ;
    end
end

% % % Cells to exclude in pre-sorting version
% % WT.PC.SS.data(:,[3 18]) = 0 ; 
% % WT.PC.CS.data(:,[3 18]) = 0 ;
% % MUT.PC.SS.data(:,[3 8 14 16 19 21 22 23 32 34 40 41]) = 0 ;
% % MUT.PC.CS.data(:,[3 8 14 16 19 21 22 23 32 34 40 41]) = 0 ;
% % Post-sorting exclusions:
% WT.PC.SS.data(:,[4 11]) = 0 ; 
% WT.PC.CS.data(:,[4 11]) = 0 ;
% % MUT.PC.SS.data(:,[3 16 17 23 25 27 29 30 31 39 40]) = 0 ;
% % MUT.PC.CS.data(:,[3 16 17 23 25 27 29 30 31 39 40]) = 0 ;
MUT.PC.SS.isi = diff(MUT.PC.SS.data);
MUT.PC.CS.isi = diff(MUT.PC.CS.data);

% Calculate mean HZ and CV for SS and CS
for jj = 1:size(MUT.PC.SS.isi,2) %SS
    if ~(MUT.PC.SS.isi(1,jj) == 0) && (length(nonzeros(MUT.PC.SS.data(:,jj))) < size(MUT.PC.SS.data,1))
        MUT.spikeNumb = find(MUT.PC.SS.isi(:,jj)==0,1) ;
        MUT.PC.SS.events(1,jj) = MUT.spikeNumb-2 ;
        MUT.PC.SS.length(1,jj) = MUT.PC.SS.data(MUT.spikeNumb-2,jj) - MUT.PC.SS.data(1,jj) ;
        MUT.PC.SS.HZmean(1,jj) = 1/mean(MUT.PC.SS.isi(1:MUT.spikeNumb-2,jj)) ;
        MUT.PC.SS.CVmean(1,jj) = std(MUT.PC.SS.isi(1:MUT.spikeNumb-2,jj))/mean(MUT.PC.SS.isi(1:MUT.spikeNumb-2,jj)) ;
        MUT.PC.SS.tmp = zeros(1,MUT.spikeNumb-3);
        for jj2 = 1:length(MUT.PC.SS.tmp)
            MUT.PC.SS.tmp(jj2) = 2*(abs(MUT.PC.SS.isi(jj2+1,jj)-MUT.PC.SS.isi(jj2,jj))/(MUT.PC.SS.isi(jj2+1,jj)+MUT.PC.SS.isi(jj2,jj)));
        end
        MUT.PC.SS.CV2mean(1,jj) = mean(MUT.PC.SS.tmp) ;
        MUT.PC.SS.HZmedian(1,jj) = 1/median(MUT.PC.SS.isi(1:MUT.spikeNumb-2,jj)) ;
        MUT.PC.SS.CV2median(1,jj) = median(MUT.PC.SS.tmp) ;
        MUT.PC.SS.ISIp5(1,jj) = prctile(MUT.PC.SS.isi(1:MUT.spikeNumb-2,jj),5) ;
        MUT.PC.SS.trimISI(1,jj) = prctile(MUT.PC.SS.isi(1:MUT.spikeNumb-2,jj),99) ;
        MUT.PC.SS.skew(1,jj) = skewness(nonzeros(MUT.PC.SS.isi((MUT.PC.SS.isi(1:MUT.spikeNumb-2,jj)<MUT.PC.SS.trimISI(1,jj)),jj))) ;
        MUT.PC.SS.kurt(1,jj) = kurtosis(nonzeros(MUT.PC.SS.isi((MUT.PC.SS.isi(1:MUT.spikeNumb-2,jj)<MUT.PC.SS.trimISI(1,jj)),jj))) ;
        MUT.PC.SS.pause(1,jj) = sum(MUT.PC.SS.isi((MUT.PC.SS.isi(1:MUT.spikeNumb-2,jj)>0.050),jj))/MUT.PC.SS.length(1,jj) ;
        MUT.PC.SS = rmfield(MUT.PC.SS,'tmp') ;
        MUT = rmfield(MUT,'spikeNumb') ;
    elseif ~(MUT.PC.SS.isi(1,jj) == 0)
        MUT.PC.SS.events(1,jj) = size(MUT.PC.SS.data,1) ;
        MUT.PC.SS.length(1,jj) = MUT.PC.SS.data(end,jj) - MUT.PC.SS.data(1,jj) ;
        MUT.PC.SS.HZmean(1,jj) = 1/mean(MUT.PC.SS.isi(:,jj)) ;
        MUT.PC.SS.CVmean(1,jj) = std(MUT.PC.SS.isi(:,jj))/mean(MUT.PC.SS.isi(:,jj)) ;
        MUT.PC.SS.tmp = zeros(1,size(MUT.PC.SS.isi,1)-1);
        for jj2 = 1:length(MUT.PC.SS.tmp)
            MUT.PC.SS.tmp(jj2) = 2*(abs(MUT.PC.SS.isi(jj2+1,jj)-MUT.PC.SS.isi(jj2,jj))/(MUT.PC.SS.isi(jj2+1,jj)+MUT.PC.SS.isi(jj2,jj)));
        end
        MUT.PC.SS.CV2mean(1,jj) = mean(MUT.PC.SS.tmp) ;
        MUT.PC.SS.HZmedian(1,jj) = 1/median(MUT.PC.SS.isi(:,jj)) ;
        MUT.PC.SS.CV2median(1,jj) = median(MUT.PC.SS.tmp) ;
        MUT.PC.SS.ISIp5(1,jj) = prctile(MUT.PC.SS.isi(:,jj),5) ;
        MUT.PC.SS.trimISI(1,jj) = prctile(MUT.PC.SS.isi(:,jj),99) ;
        MUT.PC.SS.skew(1,jj) = skewness(MUT.PC.SS.isi((MUT.PC.SS.isi(:,jj)<MUT.PC.SS.trimISI(1,jj)),jj)) ;
        MUT.PC.SS.kurt(1,jj) = kurtosis(MUT.PC.SS.isi((MUT.PC.SS.isi(:,jj)<MUT.PC.SS.trimISI(1,jj)),jj)) ;
        MUT.PC.SS.pause(1,jj) = sum(MUT.PC.SS.isi((MUT.PC.SS.isi(:,jj)>0.050),jj))/MUT.PC.SS.length(1,jj) ;
        MUT.PC.SS = rmfield(MUT.PC.SS,'tmp') ;
    end
end
for kk = 1:size(MUT.PC.CS.isi,2) %CS
    if ~(MUT.PC.CS.isi(1,kk) == 0) && (length(nonzeros(MUT.PC.CS.data(:,kk))) < size(MUT.PC.CS.data,1))
        MUT.spikeNumb = find(MUT.PC.CS.isi(:,kk)==0,1) ;
        MUT.PC.CS.events(1,kk) = MUT.spikeNumb-2 ;
        MUT.PC.CS.length(1,kk) = MUT.PC.CS.data(MUT.spikeNumb-2,kk) - MUT.PC.CS.data(1,kk) ;
        MUT.PC.CS.HZmean(1,kk) = 1/mean(MUT.PC.CS.isi(1:(find(MUT.PC.CS.isi(:,kk)==0,1))-2,kk)) ;
        MUT.PC.CS.CVmean(1,kk) = std(MUT.PC.CS.isi(1:(find(MUT.PC.CS.isi(:,kk)==0,1))-2,kk))/mean(MUT.PC.CS.isi(1:(find(MUT.PC.CS.isi(:,kk)==0,1))-2,kk)) ;
        MUT.PC.CS.tmp = zeros(1,find(MUT.PC.CS.isi(:,kk)==0,1)-2);
        for kk2 = 1:length(MUT.PC.CS.tmp)
            MUT.PC.CS.tmp(kk2) = 2*(abs(MUT.PC.CS.isi(kk2+1,kk)-MUT.PC.CS.isi(kk2,kk))/(MUT.PC.CS.isi(kk2+1,kk)+MUT.PC.CS.isi(kk2,kk)));
        end
        MUT.PC.CS.CV2mean(1,kk) = mean(MUT.PC.CS.tmp) ;
        MUT.PC.CS.HZmedian(1,kk) = 1/median(MUT.PC.CS.isi(1:(find(MUT.PC.CS.isi(:,kk)==0,1))-2,kk)) ;
        MUT.PC.CS.CV2median(1,kk) = median(MUT.PC.CS.tmp) ;
        MUT.PC.CS.ISIp5(1,kk) = prctile(MUT.PC.CS.isi(1:MUT.spikeNumb-2,kk),5) ;
        MUT.PC.CS = rmfield(MUT.PC.CS,'tmp') ;
        MUT = rmfield(MUT,'spikeNumb') ;
    elseif ~(MUT.PC.CS.isi(1,kk) == 0)
        MUT.PC.CS.events(1,kk) = size(MUT.PC.CS.data,1) ;
        MUT.PC.CS.length(1,kk) = MUT.PC.CS.data(end,kk) - MUT.PC.SS.data(1,kk) ;
        MUT.PC.CS.HZmean(1,kk) = 1/mean(MUT.PC.CS.isi(:,kk)) ;
        MUT.PC.CS.CVmean(1,kk) = std(MUT.PC.CS.isi(:,kk))/mean(MUT.PC.CS.isi(:,kk)) ;
        MUT.PC.CS.tmp = zeros(1,size(MUT.PC.CS.isi,1)-1);
        for kk2 = 1:length(MUT.PC.CS.tmp)
            MUT.PC.CS.tmp(kk2) = 2*(abs(MUT.PC.CS.isi(kk2+1,kk)-MUT.PC.CS.isi(kk2,kk))/(MUT.PC.CS.isi(kk2+1,kk)+MUT.PC.CS.isi(kk2,kk)));
        end
        MUT.PC.CS.CV2mean(1,kk) = mean(MUT.PC.CS.tmp) ;
        MUT.PC.CS.HZmedian(1,kk) = 1/median(MUT.PC.CS.isi(:,kk)) ;
        MUT.PC.CS.CV2median(1,kk) = median(MUT.PC.CS.tmp) ;
        MUT.PC.CS.ISIp5(1,kk) = prctile(MUT.PC.CS.isi(1,kk),5) ;
        MUT.PC.CS = rmfield(MUT.PC.CS,'tmp') ;
    end
end

% % Older way to find correct CVs
% for j = 1:size(MUTisi3,2)
%     cvStart = find(MUTisi3(:,j)>0,1) ;
%     MUTcvs(1,j) = std(MUTisi3(cvStart:end,j))/mean(MUTisi3(cvStart:end,j)) ;
% end

% % Visualize data
% Pauses = dir('*mutant*pause*.fig');
% M = figure;
% for mm = 1:size(Pauses,1)
%     hgload(Pauses(mm).name);
% %     ax = Pauses(jj) ;
% %     subplot(4,6,jj,ax) ;
% end