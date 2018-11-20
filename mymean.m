%%
%WARMUP
function avg =mymean(A)

if isempty(A)
    avg = 0;

else
    avg = nansum(A)/numel(A(~isnan(A)));
end
