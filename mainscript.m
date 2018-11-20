clear
close all
clc

data = xlsread('STRATOGEM_plankton.xls');
date = datetime(data(:,1),'ConvertFrom','excel');