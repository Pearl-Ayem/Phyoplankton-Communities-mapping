function H = shannonWiener(pCounts)
H=0;
    for i = [1:length(pCounts)]
        pi = pCounts(i)/nansum(pCounts,2);
        H_i = p_i * log(p_i);  
        H = H - H_i; 
    end