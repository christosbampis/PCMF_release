function [U, evo] = apply_pcmf_fast(U, X, max_2, eta, shrink, re_norm)

m = size(X,1);
XX = X * X';

for iter = 1 : max_2
    
    XXU = XX*U;
    Q = ((2*XXU) ./ ...
        (U*(U'*XXU) + XXU*(U'*U)+eps));
    
    if shrink
        
        Q = shrink_norm_with_eta(Q, eta);
        
    end;
    
    U = U .* Q;
    
    if re_norm
        
        U = U ./ norm(U);
        
    end;
    
end;

evo = norm(X-U*(U'*X), 'fro');

end