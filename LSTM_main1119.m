% Load data
clc
clear
close all
load("Data\traindataSA0815.mat");

%% Prepare data for LSTM
numFeatures = 5;  % Number of input features (Pitch Rate, Lift Coefficient, Elevator Angle)
numResponses = 2;  % Number of output responses (Attack Angle)
% numTimeStepsTrain = floor(0.9*numel(data.Time));  % Use 90% of the data for training
% X = [traindata.RollRate, traindata.SideCoefficient, traindata.RudderAngle, traindata.YawRate];  % Input data
% Y = traindata.SlideAngle;  % Output data
%% SA&AOA估计
X = [VNED.signals.values,PSI.signals.values,THETA.signals.values];
Y = [AOA.signals.values,SA.signals.values];



%% Standardize the data
mu_X = mean(X);
sig_X = std(X);
mu_Y = mean(Y);
sig_Y = std(Y);
X_norm = (X - mu_X) ./ sig_X;
Y_norm = (Y - mu_Y) ./ sig_Y;

% Define LSTM network
inputSize = numFeatures;
outputSize = 200;
outputMode = 'sequence';
layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(outputSize,'OutputMode','sequence')
    fullyConnectedLayer(numResponses)
    regressionLayer];

    %'SequenceLength',outputSize,...

options = trainingOptions('adam', ...
    'ExecutionEnvironment','gpu',...
    'MaxEpochs',100, ...
    'MiniBatchSize',outputSize, ...
    'InitialLearnRate',0.005, ...
    'GradientThreshold',0.001, ...
    'Shuffle','never', ...
    'Verbose',0, ...
    'Plots','training-progress');

% Train LSTM network
net = trainNetwork(X_norm',Y_norm',layers,options);

% Use trained LSTM network to make predictions
% XTest = X(numTimeStepsTrain+1:end,:);
% YTest = Y(numTimeStepsTrain+1:end);
% 
% XTest = (XTest - mu) ./ sig;

[net,YPred] = predictAndUpdateState(net,X_norm');
YPred = YPred' .* sig_Y + mu_Y;
%%
% for i = 1:size(X_norm(10000,:),1)
%     %net = load("NNModel\lstmnetSA.mat");
%     [~,YPred_test(i)] = predictAndUpdateState(net,X_norm(i,:)');
%     YPred_test(i) = YPred_test(i)* sig_Y + mu_Y;
% end
% [net,YPred] = predictAndUpdateState(net,YTrain(end));

% numTimeStepsTest = numel(XTest);
% for i = 2:numTimeStepsTest
%     [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','cpu');
% end

% Compare the predicted and actual attack angles
traindata.Time = 0:0.01:(size(SA.signals.values,1) - 1)*0.01;
figure
plot(traindata.Time,SA.signals.values,'LineWidth',2);
hold on;
plot(traindata.Time,AOA.signals.values,'LineWidth',2);
plot(traindata.Time,YPred(:,1))
plot(traindata.Time,YPred(:,2))

% plot(traindata.Time,YPred_test*57.3,'LineStyle','--')
%%  均方根误差
M = size(SA.signals.values, 1);
N = size(AOA.signals.values, 1);

error1 = sqrt(mean((YPred(:,1) - AOA.signals.values).^2));
error2 = sqrt(mean((YPred(:,2) - SA.signals.values).^2));
mae3 = mean(YPred(:,1) - AOA.signals.values);
mae4 = mean(YPred(:,2) - SA.signals.values);
%% test one dataset
X = [VNED0.signals.values,PSI0.signals.values,THETA0.signals.values];
Y = [AOA0.signals.values,SA0.signals.values];

% X = [VNED.signals.values(:,1:2),PSI.signals.values];
% Y = [SA.signals.values];


% Standardize the data
mu_X = mean(X);
sig_X = std(X);
mu_Y = mean(Y);
sig_Y = std(Y);
X_norm = (X - mu_X) ./ sig_X;
Y_norm = (Y - mu_Y) ./ sig_Y;

[~,YPred_1] = predictAndUpdateState(net,X_norm(1:20001,:)',"SequenceLength","shortest");
YPred_1 = YPred_1' .* sig_Y + mu_Y;


YPred_1_Time = 0:0.01:(18001 - 1)*0.01;

% for i = 1:(size(X_norm,1) - 1)/1000
%     %net = load("NNModel\lstmnet.mat");
%     YPred_test((1000*i - 999):(1000*i +1)) = predict(net,X_norm((1000*i - 999):(1000*i +1),:)');
%     YPred_test((1000*i - 999):(1000*i +1)) = YPred_test((1000*i - 999):(1000*i +1))* sig_Y + mu_Y;
% end
% Compare the predicted and actual attack angles
traindata.Time = 0:0.01:(size(SA0.signals.values,1) - 1)*0.01;
figure
plot(traindata.Time,SA0.signals.values,'LineWidth',2);
hold on;
plot(traindata.Time,YPred_1)
% plot(traindata.Time,YPred_test*57.3,'LineStyle','--')
