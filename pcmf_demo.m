clear
close all
clc

% include necessary folders and files
addpath(genpath('Datasets'))
addpath(genpath('Functions'))

% pick MovieLens dataset, can be 100K or 1M
db = '1M';

% setup parameters (see paper)
shrink = 1;
re_norm = 0;
% learning rate
eta = 0.5;
% number of inner and outer iterations
max_1 = 50;
max_2 = 20;
% number of latent factors
rnk = 12;
% train/test split
pair = 1;

% extract train and test sets based on the train/test split
[trainset, testset, global_mean, ...
    user_bias, item_bias] = ...
    pick_run(pair, db);

sX = size(trainset);

% apply PCMF
tic
[MAE, RMSE] = ...
    pcmf(trainset, rnk, max_1, ...
    max_2, sX, eta, shrink, re_norm, testset, global_mean, ...
    user_bias, item_bias);
toc
