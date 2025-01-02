%{
blockAvgCTD.m
Purpose: Block average upper and lower CTD values for specified deployment;
stores into UVL.mat

Requires:
modify CTD to load correct file. 
run thirdCTD first. 

Authors: Victor Nguyen
         Department of Earth, Marine, and Environmental Sciences
         UNC-Chapel Hill

Created: 

%}

block_upperTemp = blockAverage(cupperTemp_avg, 20);
block_upperSal = blockAverage(cupperSal_avg, 20);
block_upperDens = blockAverage(cupperDens_avg, 20);
block_upperDepth = blockAverage(cupperDepth_avg, 20);

block_lowerTemp = blockAverage(clowerTemp_avg, 20);
block_lowerSal = blockAverage(clowerSal_avg, 20);
block_lowerDens = blockAverage(clowerDens_avg, 20);
block_lowerDepth = blockAverage(clowerDepth_avg, 20);

cblock_lat = blockAverage(clat_avg, 20);
cblock_lon = blockAverage(clon_avg, 20);
cblock_time = blockAverage(ctime_avg, 20);
cblock_depth = blockAverage(depth_avg, 20);

save('Ramses2UVL.mat', "cblock_time", "cblock_lat", "cblock_lon", ...
    "block_upperTemp", "block_lowerTemp", "block_upperSal", "block_lowerSal", ...
    "block_upperDens", "block_lowerDens", "block_upperDepth", "block_lowerDepth", "cblock_depth", '-mat');



%plot all the time series

% figure;
% p1 = subplot(211);
% plot(ctime_avg, cupperTemp_avg);
% hold on;
% plot(ctime_avg, clowerTemp_avg);
% datetick
% xlabel('Date');
% ylabel('Temperature');
% legend({'Upper', 'Lower'}, 'Location', 'northeast');
% title('Ramses 1 Temperature (Original)');
% 
% p2 = subplot(212);
% plot(cblock_time, block_upperTemp);
% hold on;
% plot(cblock_time, block_lowerTemp);
% datetick
% xlabel('Date');
% ylabel('Temperature');
% legend({'Upper', 'Lower'}, 'Location', 'northeast');
% title('Ramses 1 Temperature (Block Averaged)');
% 
% 
% linkaxes([p1 p2], 'x');
% 
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH/CTD Upper vs Lower/R1tempALL.png', '-m3', '-nocrop');
% 
% figure;
% p1 = subplot(211);
% plot(ctime_avg, cupperSal_avg);
% hold on;
% plot(ctime_avg, clowerSal_avg);
% datetick
% xlabel('Date');
% ylabel('Salinity');
% legend({'Upper', 'Lower'}, 'Location', 'northeast');
% title('Modena Salinity (Original)');
% 
% p2 = subplot(212);
% plot(cblock_time, block_upperSal);
% hold on;
% plot(cblock_time, block_lowerSal);
% datetick
% xlabel('Date');
% ylabel('Salinity');
% legend({'Upper', 'Lower'}, 'Location', 'northeast');
% title('Modena 1 Salinity (Block Averaged)');
% 
% linkaxes([p1 p2], 'x');
% 
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH/CTD Upper vs Lower/M1salALLNEW.png', '-m3', '-nocrop');
% 
% figure;
% p1 = subplot(211);
% plot(ctime_avg, cupperDens_avg);
% hold on;
% plot(ctime_avg, clowerDens_avg);
% datetick
% xlabel('Date');
% ylabel('Density');
% legend({'Upper', 'Lower'}, 'Location', 'northeast');
% title('Ramses 1 Density (Original)');
% 
% p2 = subplot(212);
% plot(cblock_time, block_upperDens);
% hold on;
% plot(cblock_time, block_lowerDens);
% datetick
% xlabel('Date');
% ylabel('Density');
% legend({'Upper', 'Lower'}, 'Location', 'northeast');
% title('Ramses 1 Density (Block Averaged)');
% 
% linkaxes([p1 p2], 'x');
% 
% export_fig ('/Users/victornguyen/Documents/MATLAB/PEACH/CTD Upper vs Lower/R1densALL.png', '-m3', '-nocrop');






function blockAverages = blockAverage(dataArray, blockSize)
    originalSize = length(dataArray);
    numBlocks = floor(originalSize / blockSize);
    blockAverages = zeros(1, numBlocks);

    for i = 1:numBlocks
        currentBlock = dataArray((i-1)*blockSize + 1 : i*blockSize);
        blockAverages(i) = mean(currentBlock, 'all', 'omitnan');
    end
end
