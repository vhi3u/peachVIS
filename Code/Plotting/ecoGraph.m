%{

ecoGraph.m
Purpose: Creates CTD graphs from glider deployments

Requires:
<glidername>_DeploymentX_CTD_L1.mat
Run wdepthtest.m with appropriate file number. 

Authors:  Victor Nguyen
           Department of Earth, Marine, and Environmental Sciences
           UNC-Chapel Hill

Created: June 2023

Plot all deployments ECO values. Make sure to change the values for
the ranges of each plot. same with caxis and exportfig file directory.

Example ranges: 

R3ECO;
chlor: 0 5
cdom: 0 3
scatter: 0 0.008

R4ECO:
chlor : 0 3.75
cdom: -.5 3
scatter: 0 0.004

R5ECO
chlor: 0 1.25
cdom: 0 2.8
scatter: -0.002 0.0060

R6ECO
chlor: 0 2.75
cdom: 0 4
scatter: 0 0.008

R7ECO
chlor: 0 3
cdom: 0 3.25
scatter: 0 0.004

%}

i = input("Deployment Number: ");
eco_name = sprintf("Ramses_Deployment%i_ECO_L1.mat", i);
eco = load(eco_name);

% %trim for deployment 
% eco.ptime_datenum = eco.ptime_datenum(9:end);
% eco.chlor = eco.chlor(9:end);
% eco.cdom = eco.cdom(9:end);
% eco.depth = eco.depth(9:end);
% eco.scatter = eco.scatter(9:end);

figure
subplot(311)
ccplot(eco.ptime_datenum,-eco.depth, eco.chlor, [0 2.75], '.',10);
hold on 
% plot(ctd.ptime_datenum, -wdepthi, 'Color','k', LineStyle='-');
datetick
a = colorbar;
clim([0 2.75]);
ylabel('Depth (m)');
ylabel(a, 'Chlorophyll Fluorescence (10 x 10^{-6} g/l)');
title(sprintf('Ramses Deployment %i ECO',i),"Chlorophyll Fluorescence",'Interpreter','none');

subplot(312)
ccplot(eco.ptime_datenum,-eco.depth, eco.cdom, [0 4], '.',10);
hold on 
% plot(ctd.ptime_datenum, -wdepthi, 'Color','k', LineStyle='-');
datetick
b = colorbar;
clim([0 4]);
ylabel('Depth (m)');
ylabel(b, 'CDOM (ppb)');
title("\rmColored Dissolved Organic Matter");

subplot(313)
ccplot(eco.ptime_datenum,-eco.depth, eco.scatter, [0 0.008], '.',10);
hold on 
% plot(ctd.ptime_datenum, -wdepthi, 'Color','k', LineStyle='-');
datetick
c = colorbar;
clim([0 0.008]);
ylabel('Depth (m)');
ylabel(c, 'Optical Backscatter (1/mm)');
title("\rmOptical Backscatter");
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH MAIN/POSTER/R6ECO.png', '-m3', '-nocrop');
hold off
