%{
ecoSortGraphs.m
Purpose: Creates histograms of Chlorophyll upper and lower values. Run zoneSortECO.m first.  

Requires:
zoneSortECO.m


Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Created: 2024

Zones 1, A, and B omitted due to lack of data values within the zone. See
zoneSort.m

%}
num_bins = 20;

figure;

% subplot(4, 3, 1);
% histogram(z1.upperChlor_all, num_bins, 'BinLimits', [0 4]);
% title(sprintf('Zone 1 \nCount: %d Mean: %.2f STD: %.2f', length(z1.upperChlor_all), mean(z1.upperChlor_all, 'omitnan'), std(z1.upperChlor_all, 'omitnan')));
% xlabel('Upper Chlorophyll');
% ylabel('Frequency');

subplot(4, 2, 1);
histogram(z2.upperChlor_all, num_bins, 'BinLimits', [0 4], 'Normalization','pdf');
title(sprintf('Zone 2 \nCount: %d Mean: %.2f STD: %.2f', length(z2.upperChlor_all), mean(z2.upperChlor_all, 'omitnan'), std(z2.upperChlor_all, 'omitnan')));
xlabel('Upper Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 2);
histogram(z3.upperChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 3 \nCount: %d Mean: %.2f STD: %.2f', length(z3.upperChlor_all), mean(z3.upperChlor_all, 'omitnan'), std(z3.upperChlor_all, 'omitnan')));
xlabel('Upper Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 3);
histogram(z4.upperChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 4 \nCount: %d Mean: %.2f STD: %.2f', length(z4.upperChlor_all), mean(z4.upperChlor_all, 'omitnan'), std(z4.upperChlor_all, 'omitnan')));
xlabel('Upper Salinity');
ylabel('Frequency');

subplot(4, 2, 4);
histogram(z5.upperChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 5 \nCount: %d Mean: %.2f STD: %.2f', length(z5.upperChlor_all), mean(z5.upperChlor_all, 'omitnan'), std(z5.upperChlor_all, 'omitnan')));
xlabel('Upper Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 5);
histogram(z6.upperChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 6 \nCount: %d Mean: %.2f STD: %.2f', length(z6.upperChlor_all), mean(z6.upperChlor_all, 'omitnan'), std(z6.upperChlor_all, 'omitnan')));
xlabel('Upper Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 6);
histogram(z7.upperChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 7 \nCount: %d Mean: %.2f STD: %.2f', length(z7.upperChlor_all), mean(z7.upperChlor_all, 'omitnan'), std(z7.upperChlor_all, 'omitnan')));
xlabel('Upper Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 7);
histogram(z8.upperChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 8 \nCount: %d Mean: %.2f STD: %.2f', length(z8.upperChlor_all), mean(z8.upperChlor_all, 'omitnan'), std(z8.upperChlor_all, 'omitnan')));
xlabel('Upper Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 8);
histogram(z9.upperChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 9 \nCount: %d Mean: %.2f STD: %.2f', length(z9.upperChlor_all), mean(z9.upperChlor_all, 'omitnan'), std(z9.upperChlor_all, 'omitnan')));
xlabel('Upper Chlorophyll');
ylabel('Frequency');

% subplot(4, 3, 10);
% histogram(zA.upperChlor_all, num_bins, 'BinLimits', [0 4]);
% title(sprintf('Zone A \nCount: %d Mean: %.2f STD: %.2f', length(zA.upperChlor_all), mean(zA.upperChlor_all, 'omitnan'), std(zA.upperChlor_all, 'omitnan')));
% xlabel('Upper Chlorophyll');
% ylabel('Frequency');
% 
% subplot(4, 3, 11);
% histogram(zB.upperChlor_all, num_bins, 'BinLimits', [0 4]);
% title(sprintf('Zone B \nCount: %d Mean: %.2f STD: %.2f', length(zB.upperChlor_all), mean(zB.upperChlor_all, 'omitnan'), std(zB.upperChlor_all, 'omitnan')));
% xlabel('Upper Chlorophyll');
% ylabel('Frequency');

% Adjust the layout
sgtitle('Histogram of Upper Chlorophyll for Each Zone');
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH_UpperChlor_dist_new.png', '-m3', '-nocrop');



figure;

% subplot(4, 3, 1);
% histogram(z1.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
% title(sprintf('Zone 1 \nCount: %d Mean: %.2f STD: %.2f', length(z1.lowerChlor_all), mean(z1.lowerChlor_all, 'omitnan'), std(z1.lowerChlor_all, 'omitnan')));
% xlabel('Lower Chlorophyll');
% ylabel('Frequency');

subplot(4, 2, 1);
histogram(z2.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 2 \nCount: %d Mean: %.2f STD: %.2f', length(z2.lowerChlor_all), mean(z2.lowerChlor_all, 'omitnan'), std(z2.lowerChlor_all, 'omitnan')));
xlabel('Lower Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 2);
histogram(z3.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 3 \nCount: %d Mean: %.2f STD: %.2f', length(z3.lowerChlor_all), mean(z3.lowerChlor_all, 'omitnan'), std(z3.lowerChlor_all, 'omitnan')));
xlabel('Lower Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 3);
histogram(z4.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 4 \nCount: %d Mean: %.2f STD: %.2f', length(z4.lowerChlor_all), mean(z4.lowerChlor_all, 'omitnan'), std(z4.lowerChlor_all, 'omitnan')));
xlabel('Lower Salinity');
ylabel('Frequency');

subplot(4, 2, 4);
histogram(z5.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 5 \nCount: %d Mean: %.2f STD: %.2f', length(z5.lowerChlor_all), mean(z5.lowerChlor_all, 'omitnan'), std(z5.lowerChlor_all, 'omitnan')));
xlabel('Lower Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 5);
histogram(z6.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 6 \nCount: %d Mean: %.2f STD: %.2f', length(z6.lowerChlor_all), mean(z6.lowerChlor_all, 'omitnan'), std(z6.lowerChlor_all, 'omitnan')));
xlabel('Lower Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 6);
histogram(z7.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 7 \nCount: %d Mean: %.2f STD: %.2f', length(z7.lowerChlor_all), mean(z7.lowerChlor_all, 'omitnan'), std(z7.lowerChlor_all, 'omitnan')));
xlabel('Lower Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 7);
histogram(z8.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
title(sprintf('Zone 8 \nCount: %d Mean: %.2f STD: %.2f', length(z8.lowerChlor_all), mean(z8.lowerChlor_all, 'omitnan'), std(z8.lowerChlor_all, 'omitnan')));
xlabel('Lower Chlorophyll');
ylabel('Frequency');

subplot(4, 2, 8);
histogram(z9.lowerChlor_all, num_bins);
title(sprintf('Zone 9 \nCount: %d Mean: %.2f STD: %.2f', length(z9.lowerChlor_all), mean(z9.lowerChlor_all, 'omitnan'), std(z9.lowerChlor_all, 'omitnan')));
xlabel('Lower Chlorophyll');
ylabel('Frequency');

% subplot(4, 3, 10);
% histogram(zA.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
% title(sprintf('Zone A \nCount: %d Mean: %.2f STD: %.2f', length(zA.lowerChlor_all), mean(zA.lowerChlor_all, 'omitnan'), std(zA.lowerChlor_all, 'omitnan')));
% xlabel('Lower Chlorophyll');
% ylabel('Frequency');
% 
% subplot(4, 3, 11);
% histogram(zB.lowerChlor_all, num_bins, 'BinLimits', [0 4]);
% title(sprintf('Zone B \nCount: %d Mean: %.2f STD: %.2f', length(zB.lowerChlor_all), mean(zB.lowerChlor_all, 'omitnan'), std(zB.lowerChlor_all, 'omitnan')));
% xlabel('Lower Chlorophyll');
% ylabel('Frequency');

% Adjust the layout
sgtitle('Histogram of Lower Chlorophyll for Each Zone');
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH_LowerChlor_dist_new.png', '-m3', '-nocrop');