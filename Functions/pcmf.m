function [MAE, RMSE] = ...
    pcmf(trainset, rnk, max_1, max_2, ...
    sizeX, eta, shrink, re_norm, testset, global_mean, ...
    user_bias, item_bias)

sampled_pts = find(trainset~=0);
A = opRestriction(prod(sizeX), sampled_pts);
y = A(trainset(:), 1);

U = randn(sizeX(1), rnk);
x_guess = U*(U'*trainset);

for iter = 1 : max_1
    
    ynew = x_guess(:)+A((y-A(x_guess(:),1)),2);
    Ymat = reshape(ynew,sizeX);
    
    U = apply_pcmf_fast(U, Ymat, max_2, eta, shrink, re_norm);

    x_guess = U*(U'*trainset);
    
end

X_interaction = x_guess;

X_estimated = zeros(size(X_interaction));

for r = 1 : size(X_interaction, 1)
    for c = 1 : size(X_interaction, 2)
        X_estimated(r, c) = X_interaction(r,c) + ...
            user_bias(r, 1) + item_bias(1, c) + global_mean;
    end
end

[MAE, RMSE]= ...
    error_rate_with_rmse(testset, X_estimated);

end



