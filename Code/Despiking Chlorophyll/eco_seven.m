%{
eco_seven.m
Purpose: runs seven point filtering system on eco chlor data to "despike". 

Requires:
ccplot

Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Created: 

Input: Glider_DeploymentX_ECO_L1.mat
%}

%Preloading file 
file_name = input("Please enter the name of the file: ");
r3b = load(file_name);
%Establishing chlor
baseChlor = r3b.chlor * NaN;
baseCDOM = r3b.cdom * NaN;
baseScatter = r3b.scatter * NaN;

%7 point running minimum filter across data values for Chlor
mbaseChlor = baseChlor;
for i=4:length(baseChlor)-3
    mbaseChlor(i)=min(r3b.chlor(i-3:i+3));
end
mbaseChlor(1:3)=mbaseChlor(4)*ones(3,1);
mbaseChlor(end-2:end)=mbaseChlor(end-3)*ones(3,1);
%7 point running maximum filter across minimum filter
for i=4:length(baseChlor)-3
    baseChlor(i)=max(mbaseChlor(i-3:i+3));
end
baseChlor(1:3)=baseChlor(4)*ones(3,1);
baseChlor(end-2:end)=baseChlor(end-4)*ones(3,1);

%7 point running minimum filter across data values for CDOM
mbaseCDOM = baseCDOM;
for i=4:length(baseCDOM)-3
    mbaseCDOM(i)=min(r3b.cdom(i-3:i+3));
end
mbaseCDOM(1:3)=mbaseCDOM(4)*ones(3,1);
mbaseCDOM(end-2:end)=mbaseCDOM(end-3)*ones(3,1);
%7 point running maximum filter across minimum filter
for i=4:length(baseCDOM)-3
    baseCDOM(i)=max(mbaseCDOM(i-3:i+3));
end
baseCDOM(1:3)=baseCDOM(4)*ones(3,1);
baseCDOM(end-2:end)=baseCDOM(end-4)*ones(3,1);

%7 point running minimum filter across data values for Scatter
mbaseScatter = baseScatter;
for i=4:length(baseScatter)-3
    mbaseScatter(i)=min(r3b.scatter(i-3:i+3));
end
mbaseScatter(1:3)=mbaseScatter(4)*ones(3,1);
mbaseScatter(end-2:end)=mbaseScatter(end-3)*ones(3,1);
%7 point running maximum filter across minimum filter
for i=4:length(baseScatter)-3
    baseScatter(i)=max(mbaseScatter(i-3:i+3));
end
baseScatter(1:3)=baseScatter(4)*ones(3,1);
baseScatter(end-2:end)=baseScatter(end-4)*ones(3,1);

%create spike values
spikeChlor = r3b.chlor - baseChlor;
spikeCDOM = r3b.cdom - baseCDOM;
spikeScatter = r3b.scatter - baseScatter;

%set threshold for spikes
thresholdChlor = prctile(spikeChlor, 95);
spikeChlor(spikeChlor < thresholdChlor*2) = 0;
thresholdCDOM = prctile(spikeCDOM, 95);
spikeCDOM(spikeCDOM < thresholdCDOM*2) = 0;
thresholdScatter = prctile(spikeScatter, 90);
spikeScatter(spikeScatter < thresholdScatter*2) = 0;

% figure
% plot(r3b.ptime_datenum, r3b.chlor)
% hold on
% plot(r3b.ptime_datenum,baseChlor)
% spikeplusChlor = spikeChlor;
% spikeplusChlor(spikeChlor > 0) = spikeChlor(spikeChlor > 0)+baseChlor(spikeChlor > 0);
% plot(r3b.ptime_datenum,spikeplusChlor, 'r.')
% title(sprintf('%s',file_name),"Chlorophyll with Spikes",'Interpreter','none')
% export_fig ('/Users/victornguyen/Documents/MATLAB/Ramses/ramsesMasterfigures/spikeChlor.png', '-m3', '-nocrop');
% hold off
% 
% figure
% plot(r3b.ptime_datenum, r3b.cdom)
% hold on
% plot(r3b.ptime_datenum, baseCDOM)
% spikeplusCDOM = spikeCDOM;
% spikeplusCDOM(spikeCDOM > 0) = spikeCDOM(spikeCDOM > 0)+baseCDOM(spikeCDOM > 0);
% plot(r3b.ptime_datenum,spikeplusCDOM, 'r.')
% title(sprintf('%s',file_name),"CDOM with Spikes",'Interpreter','none')
% export_fig ('/Users/victornguyen/Documents/MATLAB/Ramses/ramsesMasterfigures/spikeCdom.png', '-m3', '-nocrop');
% hold off
% 
% figure
% plot(r3b.ptime_datenum, r3b.scatter)
% hold on
% plot(r3b.ptime_datenum, baseScatter)
% spikeplusScatter = spikeScatter;
% spikeplusScatter(spikeScatter > 0) = spikeScatter(spikeScatter > 0)+baseScatter(spikeScatter > 0);
% plot(r3b.ptime_datenum,spikeplusScatter, 'r.')
% title(sprintf('%s',file_name),"Scatter with Spikes",'Interpreter','none')
% export_fig ('/Users/victornguyen/Documents/MATLAB/Ramses/ramsesMasterfigures/spikeScatter.png', '-m3', '-nocrop');
% hold off