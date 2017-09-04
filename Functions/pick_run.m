function [trainset, testset, global_mean, ...
    user_bias, item_bias] = pick_run(run, database)

if strcmp(database, '1M')
    load dataset_1m.mat;
else
    load fold_5_dataset_2.mat;
end;

if run == 1
    
    trainset = mt1;
    testset = m1;
    global_mean = g_mean1;
    user_bias = bu_11;
    item_bias = bi_11;
    
elseif run == 2
    
    trainset = mt2;
    testset = m2;
    global_mean = g_mean2;
    user_bias = bu_22;
    item_bias = bi_22;
    
elseif run == 3
    
    trainset = mt3;
    testset = m3;
    global_mean = g_mean3;
    user_bias = bu_33;
    item_bias = bi_33;
    
elseif run == 4
    
    trainset = mt4;
    testset = m4;
    global_mean = g_mean4;
    user_bias = bu_44;
    item_bias = bi_44;
    
elseif run == 5
    
    trainset = mt5;
    testset = m5;
    global_mean = g_mean5;
    user_bias = bu_55;
    item_bias = bi_55;

else
    
    disp('Wrong choice')
    
end

