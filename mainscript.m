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
    