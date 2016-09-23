clc;
fprintf('\n\n')
fprintf('---------------------------------------------------------------\n')
fprintf('---------------------------------------------------------------\n')
fprintf('Calculation of the Two Component system -----------------------\n')
fprintf('---------------------------------------------------------------\n')
fprintf('Here we have two experiments:    ------------------------------\n')
fprintf('-- 1. Changing the tumbling parameter -------------------------\n')
fprintf('-- 2. Changing the effective concentration --------------------\n')
fprintf('---------------------------------------------------------------\n')
fprintf('---------------------------------------------------------------\n')
fprintf('\n\n')

%  % Experiment 1
%  fprintf('-- 1. Changing the tumbling parameter -------------------------\n')
%  % Experiment 1.1: Same concentration
%  fprintf('-- Experiment 1.1: Same concentration -------------------------\n')
%  Shear     = 0.0:0.25:15.0;
%  TumblingA = 1.00; % Fixed value
%  TumblingB = 0.25:0.025:3.25;
%  Theta = [-0.5 -0.5 1];
%  Sigma = 0.0;
%  fprintf('-- Experiment 1.1: Same concentration -------------------------\n')
%  fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
%  fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
%  fprintf(strcat('TumblingB \t = \t',num2str(TumblingB(1)),':',num2str(TumblingB(2)-TumblingB(1)),':',num2str(TumblingB(end)),'\n'))
%  fprintf(strcat('ThetaA  \t = \t', num2str(Theta(1)),'\n'))
%  fprintf(strcat('ThetaB  \t = \t', num2str(Theta(2)),'\n'))
%  fprintf(strcat('ThetaAB \t = \t', num2str(Theta(3)),'\n'))
%  fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Calculating data:\n')
%  AlignmentData = DataTwoComp(Theta, Shear, Sigma, TumblingA, TumblingB);
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Analyzing data:\n')
%  AnalyzeDataTwoComp(TumblingA, TumblingB, Shear, Theta, Sigma, AlignmentData);
%  fprintf('---------------------------------------------------------------\n')
%  
%  clear all;
%  
%  % Experiment 1.2: Diff. concentration
%  fprintf('-- Experiment 1.2: Diff. concentration ------------------------\n')
%  Shear     = 0.0:0.25:15.0;
%  TumblingA = 1.00; % Fixed value
%  TumblingB = 0.25:0.025:3.25;
%  Theta = [-0.5 -1.0 1];
%  Sigma = 0.0;
%  fprintf('-- Experiment 1.1: Same concentration -------------------------\n')
%  fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
%  fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
%  fprintf(strcat('TumblingB \t = \t',num2str(TumblingB(1)),':',num2str(TumblingB(2)-TumblingB(1)),':',num2str(TumblingB(end)),'\n'))
%  fprintf(strcat('ThetaA  \t = \t', num2str(Theta(1)),'\n'))
%  fprintf(strcat('ThetaB  \t = \t', num2str(Theta(2)),'\n'))
%  fprintf(strcat('ThetaAB \t = \t', num2str(Theta(3)),'\n'))
%  fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Calculating data:\n')
%  AlignmentData = DataTwoComp(Theta, Shear, Sigma, TumblingA, TumblingB);
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Analyzing data:\n')
%  AnalyzeDataTwoComp(TumblingA, TumblingB, Shear, Theta, Sigma, AlignmentData);
%  fprintf('---------------------------------------------------------------\n')
%  
%  clear all;

% Experiment 1.2: Diff. concentration
fprintf('-- Experiment 1.3: Diff. concentration ------------------------\n')
Shear     = 0.0:0.025:15.0;
TumblingA = 1.20; % Fixed value
TumblingB = 1.00:0.025:3.50;
Theta = [-0.75 -1.25 2];
Sigma = 0.0;
fprintf('-- Experiment 1.3: Same concentration -------------------------\n')
fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
fprintf(strcat('TumblingB \t = \t',num2str(TumblingB(1)),':',num2str(TumblingB(2)-TumblingB(1)),':',num2str(TumblingB(end)),'\n'))
fprintf(strcat('ThetaA  \t = \t', num2str(Theta(1)),'\n'))
fprintf(strcat('ThetaB  \t = \t', num2str(Theta(2)),'\n'))
fprintf(strcat('ThetaAB \t = \t', num2str(Theta(3)),'\n'))
fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
fprintf('---------------------------------------------------------------\n')
fprintf('\n\n')
fprintf('---------------------------------------------------------------\n')
fprintf('Calculating data:\n')
AlignmentData = DataTwoComp(Theta, Shear, Sigma, TumblingA, TumblingB);
fprintf('---------------------------------------------------------------\n')
fprintf('---------------------------------------------------------------\n')
fprintf('Analyzing data:\n')
AnalyzeDataTwoComp(TumblingA, TumblingB, Shear, Theta, Sigma, AlignmentData);
fprintf('---------------------------------------------------------------\n')

clear all;

%  
%  % Experiment 2
%  fprintf('-- 2. Changing the effective concentration --------------------\n')
%  % Experiment 2.1: Diff. effective interaction
%  fprintf('-- Experiment 2.1: TAB = 0.50 ---------------------------------\n')
%  Shear     = 0.0:0.25:15.0;
%  TumblingA = 1.0; % Fixed value
%  TumblingB = 1.5; % Fixed value
%  Sigma     = 0.0; % Fixed value
%  TB  = -12.0:0.15:-0.15;
%  TA  = -0.5*ones(length(TB),1); % Fixed value
%  TAB = 0.5*ones(length(TB),1);  % Fixed value array
%  fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
%  fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
%  fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
%  fprintf(strcat('TumblingB \t = \t',num2str(TumblingB),'\t Fixed parameter \n'))
%  fprintf(strcat('ThetaA  \t = \t', num2str(TA(1)),'\n'))
%  fprintf(strcat('ThetaB  \t = \t', num2str(TB(1)),':',num2str(TB(2)-TB(1)),':',num2str(TB(end)),'\n'))
%  fprintf(strcat('ThetaAB \t = \t', num2str(TAB(1)),'\n'))
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('Startinf the loop of concentration:\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Calculating data:\n')
%  AlignmentData = DataTwoComp_theta( TA, TB, TAB, Shear, Sigma, TumblingA, TumblingB);
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Analyzing data:\n')
%  AnalyzeDataTwoComp_theta(TumblingA, TumblingB, Shear, TA, TB, TAB, Sigma, AlignmentData);
%  fprintf('---------------------------------------------------------------\n')
%  
%  clear all;

%  % Experiment 2.2: Diff. effective interaction
%  fprintf('-- Experiment 2.2: TAB = 0.85 ---------------------------------\n')
%  Shear     = 0.0:0.25:15.0;
%  TumblingA = 1.0; % Fixed value
%  TumblingB = 1.5; % Fixed value
%  Sigma     = 0.0; % Fixed value
%  TB  = -12.0:0.15:-0.15;
%  TA  = -0.5*ones(length(TB),1); % Fixed value
%  TAB = 0.85*ones(length(TB),1);  % Fixed value array
%  fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
%  fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
%  fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
%  fprintf(strcat('TumblingB \t = \t',num2str(TumblingB),'\t Fixed parameter \n'))
%  fprintf(strcat('ThetaA  \t = \t', num2str(TA(1)),'\n'))
%  fprintf(strcat('ThetaB  \t = \t', num2str(TB(1)),':',num2str(TB(2)-TB(1)),':',num2str(TB(end)),'\n'))
%  fprintf(strcat('ThetaAB \t = \t', num2str(TAB(1)),'\n'))
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('Startinf the loop of concentration:\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Calculating data:\n')
%  AlignmentData = DataTwoComp_theta( TA, TB, TAB, Shear, Sigma, TumblingA, TumblingB);
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Analyzing data:\n')
%  AnalyzeDataTwoComp_theta(TumblingA, TumblingB, Shear, TA, TB, TAB, Sigma, AlignmentData);
%  fprintf('---------------------------------------------------------------\n')
%  
%  clear all;

%  % Experiment 2.3: Diff. effective interaction
%  fprintf('-- Experiment 2.2: TA = -0.5, TB = -0.5 --------------------------\n')
%  Shear     = 0.0:0.25:15.0;
%  TumblingA = 1.0; % Fixed value
%  TumblingB = 1.5; % Fixed value
%  Sigma     = 0.0; % Fixed value
%  TAB = 0.15:0.15:12;  % Variable array
%  TB  = -0.5*ones(length(TAB),1); % Fixed value
%  TA  = -0.5*ones(length(TAB),1); % Fixed value
%  fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
%  fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
%  fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
%  fprintf(strcat('TumblingB \t = \t',num2str(TumblingB),'\t Fixed parameter \n'))
%  fprintf(strcat('ThetaA  \t = \t', num2str(TA(1)),'\n'))
%  fprintf(strcat('ThetaB  \t = \t', num2str(TB(1)),':',num2str(TB(2)-TB(1)),':',num2str(TB(end)),'\n'))
%  fprintf(strcat('ThetaAB \t = \t', num2str(TAB(1)),'\n'))
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('Startinf the loop of concentration:\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Calculating data:\n')
%  AlignmentData = DataTwoComp_theta( TA, TB, TAB, Shear, Sigma, TumblingA, TumblingB);
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Analyzing data:\n')
%  AnalyzeDataTwoComp_theta_bis(TumblingA, TumblingB, Shear, TA, TB, TAB, Sigma, AlignmentData);
%  fprintf('---------------------------------------------------------------\n')
%  
%  clear all;
%  
%  % Experiment 2.4: Diff. effective interaction
%  fprintf('-- Experiment 2.4: TA = -0.25, TB = -0.25 --------------------------\n')
%  Shear     = 0.0:0.25:15.0;
%  TumblingA = 1.0; % Fixed value
%  TumblingB = 1.5; % Fixed value
%  Sigma     = 0.0; % Fixed value
%  TAB = 0.15:0.15:12;  % Variable array
%  TB  = -0.25*ones(length(TAB),1); % Fixed value
%  TA  = -0.25*ones(length(TAB),1); % Fixed value
%  fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
%  fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
%  fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
%  fprintf(strcat('TumblingB \t = \t',num2str(TumblingB),'\t Fixed parameter \n'))
%  fprintf(strcat('ThetaA  \t = \t', num2str(TA(1)),'\n'))
%  fprintf(strcat('ThetaB  \t = \t', num2str(TB(1)),':',num2str(TB(2)-TB(1)),':',num2str(TB(end)),'\n'))
%  fprintf(strcat('ThetaAB \t = \t', num2str(TAB(1)),'\n'))
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('Startinf the loop of concentration:\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Calculating data:\n')
%  AlignmentData = DataTwoComp_theta( TA, TB, TAB, Shear, Sigma, TumblingA, TumblingB);
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Analyzing data:\n')
%  AnalyzeDataTwoComp_theta_bis(TumblingA, TumblingB, Shear, TA, TB, TAB, Sigma, AlignmentData);
%  fprintf('---------------------------------------------------------------\n')
%  
%  clear all;
%  
%  % Experiment 2.5: Diff. effective interaction
%  fprintf('-- Experiment 2.5: TA = -0.25, TB = -0.25 --------------------------\n')
%  Shear     = 0.0:0.25:15.0;
%  TumblingA = 1.0; % Fixed value
%  TumblingB = 1.5; % Fixed value
%  Sigma     = 0.0; % Fixed value
%  TAB = 0.15:0.15:12;  % Variable array
%  TB  = -0.50*ones(length(TAB),1); % Fixed value
%  TA  = -0.25*ones(length(TAB),1); % Fixed value
%  fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
%  fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
%  fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
%  fprintf(strcat('TumblingB \t = \t',num2str(TumblingB),'\t Fixed parameter \n'))
%  fprintf(strcat('ThetaA  \t = \t', num2str(TA(1)),'\n'))
%  fprintf(strcat('ThetaB  \t = \t', num2str(TB(1)),':',num2str(TB(2)-TB(1)),':',num2str(TB(end)),'\n'))
%  fprintf(strcat('ThetaAB \t = \t', num2str(TAB(1)),'\n'))
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('Startinf the loop of concentration:\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Calculating data:\n')
%  AlignmentData = DataTwoComp_theta( TA, TB, TAB, Shear, Sigma, TumblingA, TumblingB);
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Analyzing data:\n')
%  AnalyzeDataTwoComp_theta_bis(TumblingA, TumblingB, Shear, TA, TB, TAB, Sigma, AlignmentData);
%  fprintf('---------------------------------------------------------------\n')
%  
%  clear all;

%  % Experiment 2.6: Diff. effective interaction
%  fprintf('-- Experiment 2.6: TA = -0.50, TB = -0.50 --------------------------\n')
%  Shear     = 0.0:0.25:15.0;
%  TumblingA = 1.0; % Fixed value
%  TumblingB = 2.0; % Fixed value
%  Sigma     = 0.0; % Fixed value
%  TAB = 0.15:0.15:12;  % Variable array
%  TB  = -0.50*ones(length(TAB),1); % Fixed value
%  TA  = -0.50*ones(length(TAB),1); % Fixed value
%  fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
%  fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
%  fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
%  fprintf(strcat('TumblingB \t = \t',num2str(TumblingB),'\t Fixed parameter \n'))
%  fprintf(strcat('ThetaA  \t = \t', num2str(TA(1)),'\n'))
%  fprintf(strcat('ThetaB  \t = \t', num2str(TB(1)),':',num2str(TB(2)-TB(1)),':',num2str(TB(end)),'\n'))
%  fprintf(strcat('ThetaAB \t = \t', num2str(TAB(1)),'\n'))
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('Startinf the loop of concentration:\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Calculating data:\n')
%  AlignmentData = DataTwoComp_theta( TA, TB, TAB, Shear, Sigma, TumblingA, TumblingB);
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Analyzing data:\n')
%  AnalyzeDataTwoComp_theta_bis(TumblingA, TumblingB, Shear, TA, TB, TAB, Sigma, AlignmentData);
%  fprintf('---------------------------------------------------------------\n')
%  
%  clear all;

%  % Experiment 2.7: Diff. effective interaction
%  fprintf('-- Experiment 2.7: TA = -0.75, TB = -0.75 --------------------------\n')
%  Shear     = 0.0:0.25:15.0;
%  TumblingA = 1.2; % Fixed value
%  TumblingB = 2.0; % Fixed value
%  Sigma     = 0.0; % Fixed value
%  TAB = 0.15:0.15:12;  % Variable array
%  TB  = -0.75*ones(length(TAB),1); % Fixed value
%  TA  = -0.75*ones(length(TAB),1); % Fixed value
%  fprintf(strcat('Shear \t\t = \t',num2str(Shear(1)),':',num2str(Shear(2)-Shear(1)),':',num2str(Shear(end)),'\n'))
%  fprintf(strcat('Sigma \t\t = \t',num2str(Sigma),'\n'))
%  fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\t Fixed parameter \n'))
%  fprintf(strcat('TumblingB \t = \t',num2str(TumblingB),'\t Fixed parameter \n'))
%  fprintf(strcat('ThetaA  \t = \t', num2str(TA(1)),'\n'))
%  fprintf(strcat('ThetaB  \t = \t', num2str(TB(1)),':',num2str(TB(2)-TB(1)),':',num2str(TB(end)),'\n'))
%  fprintf(strcat('ThetaAB \t = \t', num2str(TAB(1)),'\n'))
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('\n\n')
%  fprintf('Startinf the loop of concentration:\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Calculating data:\n')
%  AlignmentData = DataTwoComp_theta( TA, TB, TAB, Shear, Sigma, TumblingA, TumblingB);
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('---------------------------------------------------------------\n')
%  fprintf('Analyzing data:\n')
%  AnalyzeDataTwoComp_theta_bis(TumblingA, TumblingB, Shear, TA, TB, TAB, Sigma, AlignmentData);
%  fprintf('---------------------------------------------------------------\n')
%  
%  clear all;