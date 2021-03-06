clear
close all
clc

[plankton_counts txt raw] = xlsread('STRATOGEM_plankton.xls');
date = datetime(txt(2:end,1),'ConvertFrom','excel');
species_names=txt(1,2:end);


%% PART 2
row_sums=nansum(plankton_counts,2);

figure
subplot(211)
plot(date,row_sums, 'k-', 'Markersize', 15);
title('Total phytoplankton count per year');
xlabel('Date');
ylabel('Pythoplankton Count');
datetick;

subplot(212)
plot(date,row_sums, 'k-', 'Markersize', 15);
title('Total phytoplankton count per year-Logarithmic Scale');
xlabel('Date');
ylabel('Pythoplankton Count');
set(gca, 'yscale', 'log');
datetick;

%% PART 4: Calculate and plot the Shannon-Wiener index for the STRATOGEM data 
index_per_year=[];
for i = 1:length(plankton_counts)
    index_per_year(i)=shannonWiener(plankton_counts(i,:));
end

figure
plot(date,index_per_year,'linewidth', 1);
title('SW diversity index in the Straight of Georgia over the time');
xlabel('Date');
ylabel('SW diversity index');
datetick;

%% PART 5:  Calculate the SW index and total phytoplankton by year
pcounts2003=row_sums(year(date) == 2003);
dates2003=date(year(date) == 2003);
sw2003=index_per_year(year(date) == 2003);

figure
subplot(211)
plot(dates2003,pcounts2003, 'linewidth', 1);
title('2003 phytoplankton count', 'linewidth', 1);
xlabel('Date');
ylabel('Phytoplankton Count');

subplot(212)
plot(dates2003,sw2003, 'linewidth', 1);
title('2003 SW index');
xlabel('Date');
ylabel('SW index');



pcounts2004=row_sums(year(date) == 2004);
dates2004=date(year(date) == 2004);
sw2004=index_per_year(year(date) == 2004);

figure
subplot(211)
plot(dates2004,pcounts2004, 'linewidth', 1);
title('2004 phytoplankton count');
xlabel('Date');
ylabel('Phytoplankton Count');

subplot(212)
plot(dates2004,sw2004, 'linewidth', 1);
title('2004 SW index');
xlabel('Date');
ylabel('SW index');
