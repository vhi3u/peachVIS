%  ctdGraph.m
% Purpose: Creates CTD graphs from glider deployments
%
%  Requires:
%  MATLAB folder - contains util
%
%  Authors:  Victor Nguyen
%            Department of Earth, Marine, and Environmental Sciences
%            UNC-Chapel Hill
%
%  Created: June 2023
%
%///////////////////////////////////////////////////////////////////////////////

% Plot all deployments CTD/ECO values. Make sure to change the values for
% The ranges of each plot. same with caxis and exportfig file directory



i = input("Deployment Number: ");
ctd_name = sprintf("Ramses_Deployment%i_CTD_L1.mat", i);
ctd = load(ctd_name);

figure
subplot(311)
ccplot(ctd.ptime_datenum,-ctd.depth,ctd.temp, [18 29], '.',10);
hold on 
% plot(ctd.ptime_datenum, -wdepthi, 'Color','k', LineStyle='-');
datetick
a = colorbar;
clim([12 30]);
ylabel('Depth (m)');
ylabel(a, 'Temperature (deg C)')
title(sprintf('Ramses Deployment %i CTD',i),"Temperature",'Interpreter','none');

subplot(312)
ccplot(ctd.ptime_datenum,-ctd.depth,ctd.salin, [30 36], '.',10);
hold on
% plot(ctd.ptime_datenum, -wdepthi, 'Color','k', LineStyle='-');

datetick
b = colorbar;
clim([30 36]);
ylabel('Depth (m)');
ylabel(b, 'Salinity (psu)');
title("\rmSalinity");

subplot(313)
ccplot(ctd.ptime_datenum,-ctd.depth,ctd.dens, [1018 1024], '.',10);
hold on
% plot(ctd.ptime_datenum, -wdepthi, 'Color','k', LineStyle='-');

datetick
c = colorbar;
clim([1018 1025]);
ylabel('Depth (m)');
ylabel(c, 'Density (kg/m^3)')
title("\rmDensity");
% export_fig ('/Users/victornguyen/Documents/MATLAB/Ramses/Ramses CTD PNG/Ramses6_CTD.png', '-m3', '-nocrop');
hold off
