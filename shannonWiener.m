function H = shannonWiener(pCounts)
H=0;
mask= ~(isnan(pCounts) | pCounts==0);
pCounts=pCounts(mask);
    for i = 1:length(pCounts)
        p_i = pCounts(i)/sum(pCounts);
        H_i = p_i * log(p_i);  
        H = H - H_i; 
    end