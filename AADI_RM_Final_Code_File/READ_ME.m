%% READ ME:

% To run the model- aadi_rm_model.m file  you need to download the following files from
% this same directory
% Unit_AppetitiveActivationCode.m
% Unit_NeutralActivationCode.m
% CalcSSRT_Public.m
% cdfFunc.m
% getActFunc_Public.m
% HostCMSimulation_Public.m
% InhCumWeib.m
% LatMatch_Public.m
% OneTrial_Public.m
% PlotCM_Public.m
% SetParams_Public.m
% SSRT_bestfit.m
% ======================================================================%

% ======================================================================%
%        To test different model dynamics, parameter variations and
%                       parameter value settings
% ======================================================================%
% Change the cueType selection to change the type of model activated

% Change parameter values in the Specifying Parameters sections to try out 
% different parameter settings

% Change SSD's as per SSD's set in the study

% Change Number of Trials as per number of trials in the study

% Change lambdaGO and lambdaSTOP augmentation in the Go-unit and Stop-unit activation 
% differential eq. by opening the Unit_AppetitiveActivationCode.m script file and alter the
% placemen of lambdaGO and lambdaSTOP in the GOUnit and STOPUnit diff. eq.
% part at the end.

% For guidance on parameter variations tested in the paper see top
% instructions in the Unit_AppetitiveActivationCode.m script file 
% for the augmented diff. eqs. 
% ======================================================================%

% ======================================================================%% ======================================================================%

% Note: The Unit_AppetitiveActivationCode.m script was added by Nilosmita Banerjee
% to the original code written and provided by Boucher et.al., (2007) [(C) Boucher et.al. (2007)]
% All files/scripts from the original code provided Boucher et.al., (2007) for the
% base Interactive Race Model remain unchanged. The Unit_AppetitiveActivationCode.m script code
% is the new addition to the model proposed in the paper - 
% “Modelling Appetitive Disinhibition in Modified Stop Signal Task—A Computational model of Associative Memory initiated Going (Disinhibition) System”
% Find Research Paper here: 
% https://www.researchgate.net/publication/346718359_Modelling_Appetitive-Disinhibition_in_Modified_Stop-Signal_Task-A_Computational_model_of_Associative_Memory_initiated_Going_Disinhibition_System


% ======================================================================%% ======================================================================%



