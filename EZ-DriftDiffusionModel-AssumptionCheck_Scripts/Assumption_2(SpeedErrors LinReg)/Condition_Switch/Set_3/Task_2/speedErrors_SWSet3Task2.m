%% ==================================== Assumption 2: Run parametric test(Linear Regression) for checking relative speed errors ============================================%%%%%%
% Preparing data for Assumption 2 linear reg
% Segregate data based on set and then task type 
load('Final_Right Skew Data_SwitchingPictorial.mat')
%% SET_2 and task_2: 
% Indexing out Set_2 Task_2 for Correct RT Data: 
SET_3 = Final_SwitchPicData_switching(Final_SwitchPicData_switching.set == 'sports_color',:);
task_2Set3 = SET_3(SET_3.task == 'color',:);

%% Calculating meanRTs - correct RT's dataset:
idxSs = table();
idxRT = table();
meanRTCor_St3Task2 = cell(4,31);
for mm = 1:31
       idxSs = task_2Set3(task_2Set3.code == mm,:);
       for zz = 9:12 % this idx vals corresponds with the session idx
       idxRT = idxSs(idxSs.session == zz,{'rt'});
       rt = table2array(idxRT);
       calcMean = mean(rt);
       meanRTCor_St3Task2{zz,mm} = calcMean;
       end
end
%% Indexing out Incorrect RT Data - from task "fruit" set - 2:
switchDataIncorr = trimRTswitch_Incor(switchingpictorial);
SET_3Incorr = switchDataIncorr(switchDataIncorr.set == 'sports_color',:);
task_2Set3Incor = SET_3Incorr(SET_3Incorr.task == 'sports',:);

%% Calculating meanRTs - Incorrect RT's dataset:
idxSsIncor_St1Task1 = table();
idxRTIncor_St1Task1 = table();
meanRTIncor_St3Task2= cell(4,31);
for m = 1:31
       idxSsIncor_St1Task1 = task_2Set3Incor(task_2Set3Incor.code == m,:);
       for z = 9:12 % this idx vals corresponds with the session idx
       idxRTIncor_St1Task1= idxSsIncor_St1Task1(idxSsIncor_St1Task1.session == z,{'rt'});
       rtIncor = table2array(idxRTIncor_St1Task1);
       calcMeanIncorr = mean(rtIncor);
       meanRTIncor_St3Task2{z,m} = calcMeanIncorr;
       end
end


%% Convert all Incor MEAN RT values to NaN if the corresponding values for Cor MEAN RT is NaN:

meanRTCor_St3Task2 = cell2mat(meanRTCor_St3Task2);
meanRTIncor_St3Task2 = cell2mat(meanRTIncor_St3Task2);
for hh = 1:124 %the idx range has to be 4*31  
  if isnan(meanRTCor_St3Task2(hh))
     meanRTIncor_St3Task2(hh) = NaN;
  end 
end

%% Compile mean rt data from correct and incorrect set:
compile_MeanRts = [meanRTCor_St3Task2;meanRTIncor_St3Task2];
%compile_MeanRts = compile_MeanRts(~cellfun('isempty',compile_MeanRts));
%%  remove Ss 
 compile_MeanRts(:,29) = [];
 compile_MeanRts(:,27) = [];
 compile_MeanRts(:,20) = [];
 compile_MeanRts(:,7) = [];
 compile_MeanRts(:,6) = [];
 compile_MeanRts(:,3) = [];

 Fin_MeanRt = compile_MeanRts(:);
 %% Define the variables for the final dataset: 

SS_1 = repmat({1,1,1,1,1,1,1,1,...
               2,2,2,2,2,2,2,2,...
               4,4,4,4,4,4,4,4,...
               5,5,5,5,5,5,5,5,...
               8,8,8,8,8,8,8,8,...
               9,9,9,9,9,9,9,9,...
               10,10,10,10,10,10,10,10,...
               11,11,11,11,11,11,11,11,...
               12,12,12,12,12,12,12,12,...
               13,13,13,13,13,13,13,13,...
               14,14,14,14,14,14,14,14,...
               15,15,15,15,15,15,15,15,...
               16,16,16,16,16,16,16,16,...
               17,17,17,17,17,17,17,17,...
               18,18,18,18,18,18,18,18,...
               19,19,19,19,19,19,19,19,...
               21,21,21,21,21,21,21,21,...
               22,22,22,22,22,22,22,22,...
               23,23,23,23,23,23,23,23,...
               24,24,24,24,24,24,24,24,...
               25,25,25,25,25,25,25,25,...
               26,26,26,26,26,26,26,26,...
               28,28,28,28,28,28,28,28,...
               30,30,30,30,30,30,30,30,...
               31,31,31,31,31,31,31,31},1,1)';

code = cell2mat(SS_1);
 
sess = repmat({5,6,7,8,...
               5,6,7,8},1,25)';
session = cell2mat(sess);

resp = repmat({1,1,1,1,...
               2,2,2,2},1,25)'; 
response = cell2mat(resp);

%dumyResponse = dummyvar(response);
               
condition =  repmat({'switch','switch','switch','switch',...
                     'switch','switch','switch','switch'},1,25)';
 
set = repmat({'plane_number','plane_number','plane_number','plane_number',...
              'plane_number','plane_number','plane_number','plane_number'},1,25)';

task = repmat({'color','color','color','color',...
               'color','color','color','color',},1,25)';

stimuli = repmat({'pictorial','pictorial','pictorial','pictorial',...
                  'pictorial','pictorial','pictorial','pictorial',},1,25)';
              
MeanRT = Fin_MeanRt;

% Assemble the final dataset: 
Set3_task2_switchingPic = table(code,session,condition,set,task,stimuli,response,MeanRT,...
                          'VariableNames',{'code','session','condition','set',...
                          'task','stimuli','response','MeanRT'});

%% Linear Regression - speed errors check:

%Set-3: task-1:
%load ('switchingpictorial_RegData')
Set3_task2_switchingPic.Response = categorical(response);
model_6Set2Task2 = fitlm(Set3_task2_switchingPic,'MeanRT~session*Response')
model_6ANOVA_Set2Task2 = anova(model_6Set2Task2,'summary')

% Plotting the Residuals

figure (40)
sgtitle ({'Switching Pictorial','Set - Sports and Color','Task 2 - Color'})
subplot(2,4,1)
plotResiduals(model_6Set2Task2,'probability','Color','red')
subplot(2,4,2)
plotResiduals(model_6Set2Task2,'fitted','Color','green')
subplot(2,4,3)
plotResiduals(model_6Set2Task2,'lagged','Color','blue')
subplot(2,4,4)
plotResiduals(model_6Set2Task2,'caseorder')
subplot(2,4,5)
plotResiduals(model_6Set2Task2,'symmetry')
subplot(2,4,6)
%plotInteraction(model_1Set1Task1,'session','Response','predictions')
plotInteraction(model_6Set2Task2,'Response','session','predictions')
subplot(2,4,7)
plot(model_6Set2Task2)