%% Starting point bias check

               %% %%%%%%%%%%%%%%%%%%%%%%%%%%% Correct RT data %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Index out the category - 1
load('Final_Right Skew Data_SwitchingPictorial.mat');
cat_1Cor = Final_SwitchPicData_switching(Final_SwitchPicData_switching.category ==1,...
                                         {'code','session','condition','set','task',...
                                          'stimuli','response','rt','category'});
SET_3Category1 = cat_1Cor(cat_1Cor.set == 'sports_color',:);
task_2Set3_category1 = SET_3Category1(SET_3Category1.task == 'color',:);
                                    
                               
% Calculating meanRTs - correct RT's dataset: Category 1
idxSs_cat1 = table();
idxRT_cat1 = table();
meanRTCor_St3Task2_Category1= cell(4,31);
for mm = 1:31
       idxSs_cat1 = task_2Set3_category1(task_2Set3_category1.code == mm,:);
       for zz = 9:12 % idx that indicates the session number
       idxRT_cat1 = idxSs_cat1(idxSs_cat1.session == zz,{'rt'});
       rt = table2array(idxRT_cat1);
       calcMean = mean(rt);
       meanRTCor_St3Task2_Category1{zz,mm} = calcMean;
       end
end

%%
% Index out the category - 2
cat_2Cor = Final_SwitchPicData_switching(Final_SwitchPicData_switching.category ==2,...
                                         {'code','session','condition','set','task',...
                                          'stimuli','response','rt','category'});
SET_3Category2 = cat_2Cor(cat_2Cor.set == 'sports_color',:);
task_2Set3_category2 = SET_3Category2(SET_3Category2.task == 'color',:);


% Calculating meanRTs - correct RT's dataset: Category 2
idxSs_cat2 = table();
idxRT_cat2 = table();
meanRTCor_St3Task2_Category2= cell(4,31);
for mm = 1:31
       idxSs_cat2 = task_2Set3_category2(task_2Set3_category2.code == mm,:);
       for zz = 9:12 % idx that indicates the 
       idxRT_cat2 = idxSs_cat2(idxSs_cat2.session == zz,{'rt'});
       rt = table2array(idxRT_cat2);
       calcMean = mean(rt);
       meanRTCor_St3Task2_Category2{zz,mm} = calcMean;
       end
end
                %% %%%%%%%%%%%%%%%%%%%%%%%%% Incorrect RT data %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Index out the category - 1

% Indexing out Set_1 Task_1 for Incorrect RT Data:
switchDataIncorr = trimRTswitch_Incor(switchingpictorial);


cat_1InCor = switchDataIncorr(switchDataIncorr.category ==1,...
                              {'code','session','condition','set','task',...
                               'stimuli','response','rt','category'});
SET_3Category_1_Incor = cat_1InCor(cat_1InCor.set == 'fruit_size',:);
task_2Set3_category1Incor = SET_3Category_1_Incor(SET_3Category_1_Incor.task == 'size',:);

% Calculating meanRTs - Incorrect RT's dataset: Category 1
idxSs_cat1Incor = table();
idxRT_cat1Incor = table();
meanRT_St3Task2_Category1Incor= cell(4,31);
for mm = 1:31
       idxSs_cat1Incor = task_2Set3_category1Incor(task_2Set3_category1Incor.code == mm,:);
       for zz = 9:12 % idx indicates the session number
       idxRT_cat1Incor = idxSs_cat1Incor(idxSs_cat1Incor.session == zz,{'rt'});
       rt = table2array(idxRT_cat1Incor);
       calcMean = mean(rt);
       meanRT_St3Task2_Category1Incor{zz,mm} = calcMean;
       end
end
%%
% Index out the category - 2
cat_2InCor = switchDataIncorr(switchDataIncorr.category == 2,...
                             {'code','session','condition','set','task',...
                             'stimuli','response','rt','category'});
SET_3Category_2_Incor = cat_2InCor(cat_2InCor.set == 'sports_color',:);
task_2Set3_category2Incor = SET_3Category_2_Incor(SET_3Category_2_Incor.task == 'color',:);

%% Calculating meanRTs - correct RT's dataset: Category 2
idxSs_cat2Incor = table();
idxRT_cat2Incor = table();
meanRT_St3Task2_Category2Incor= cell(4,31);
for mm = 1:31
       idxSs_cat2Incor = task_2Set3_category2Incor(task_2Set3_category2Incor.code == mm,:);
       for zz = 9:12 % idx indicates the session number
       idxRT_cat2Incor = idxSs_cat2Incor(idxSs_cat2Incor.session == zz,{'rt'});
       rt = table2array(idxRT_cat2Incor);
       calcMean = mean(rt);
       meanRT_St3Task2_Category2Incor{zz,mm} = calcMean;
       end
end

%% Convert all Incor MEAN RT values to NaN if the corresponding values for Cor MEAN RT is NaN:

% Category - 1: Correct and Incorrect Data: 

meanRTCor_St3Task2_Category1 = cell2mat(meanRTCor_St3Task2_Category1);
meanRT_St3Task2_Category1Incor = cell2mat(meanRT_St3Task2_Category1Incor);
for hh = 1:124 %the idx range has to be 4*31  
  if isnan(meanRTCor_St3Task2_Category1(hh))
     meanRT_St3Task2_Category1Incor(hh) = NaN;
  end 
end

% Category - 2: Correct and Incorrect Data:
meanRTCor_St3Task2_Category2 = cell2mat(meanRTCor_St3Task2_Category2);
meanRT_St3Task2_Category2Incor = cell2mat(meanRT_St3Task2_Category2Incor);
for hh = 1:124 %the idx range has to be 4*31  
  if isnan(meanRTCor_St3Task2_Category2(hh))
     meanRT_St3Task2_Category2Incor(hh) = NaN;
  end 
end

%% Compile mean rt data from correct and incorrect set across Category -1&2
compile_MeanRts_category = [meanRTCor_St3Task2_Category1;meanRT_St3Task2_Category1Incor;...
                            meanRTCor_St3Task2_Category2;meanRT_St3Task2_Category2Incor];
%% remove Ss 
compile_MeanRts_category(:,29) = [];
compile_MeanRts_category(:,27) = [];
compile_MeanRts_category(:,20) = [];
compile_MeanRts_category(:,7) = [];
compile_MeanRts_category(:,6) = [];
compile_MeanRts_category(:,3) = [];

Fin_MeanRt_category = compile_MeanRts_category(:);
 
 %% Data prep for linear Regression for set-1 and task-1: 

% Define the variables for the final dataset: 

SS_1Cat = repmat({1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,...
                  2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,...
                  4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,...
                  5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,...
               8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,...
               9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,...
               10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,...
               11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,...
               12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,...
               13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,...
               14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,...
               15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,...
               16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,...
               17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,...
               18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,...
               19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,...
               21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,...
               22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,...
               23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,...
               24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,...
               25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,...
               26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,...
               28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,...
               30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,...
               31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31},1,1)';
code = cell2mat(SS_1Cat);
%%            
sess = repmat({1,2,3,4,...
               1,2,3,4},1,50)';
session = cell2mat(sess);


resp = repmat({1,1,1,1,...
               2,2,2,2},1,50)'; 
response = cell2mat(resp);
%dumyResponse = dummyvar(response);
               
condition =  repmat({'switch','switch','switch','switch',...
                     'switch','switch','switch','switch'},1,50)';
 
set = repmat({'sport_color','sport_color','sport_color','sport_color',...
              'sport_color','sport_color','sport_color','sport_color'},1,50)';

task = repmat({'color','color','color','color',...
              'color','color','color','color',},1,50)';

stimuli = repmat({'pictorial','pictorial','pictorial','pictorial',...
                  'pictorial','pictorial','pictorial','pictorial',},1,50)';
              
MeanRT_cat = Fin_MeanRt_category;

cat = repmat({1,1,1,1,1,1,1,1,...
              2,2,2,2,2,2,2,2},1,25)'; 
category = cell2mat(cat);

% Assemble the final dataset: 
Set3_task2_switchingPicFinal = table(code,session,condition,set,task,stimuli,...
                               response,MeanRT_cat,category,...
                               'VariableNames',{'code','session','condition','set',...
                               'task','stimuli','response','MeanRT_cat','category'});
                     
%% Liner Regression

Set3_task2_switchingPicFinal.Category = categorical(category);
Set3_task2_switchingPicFinal.Response = categorical(response);
model_5Set3Task2_Cat = fitlm(Set3_task2_switchingPicFinal,...
                             'MeanRT_cat~session*Category*Response')
model_5ANOVA_Set3Task2_Cat = anova(model_5Set3Task2_Cat,'summary')                     

% Plotting the Residuals

figure (41)
sgtitle ({'Switching Pictorial','Set - Sports and Color','Task 2 - Color'})
subplot(2,4,1)
plotResiduals(model_5Set3Task2_Cat,'probability','Color','red')
subplot(2,4,2)
plotResiduals(model_5Set3Task2_Cat,'fitted','Color','green')
subplot(2,4,3)
plotResiduals(model_5Set3Task2_Cat,'lagged','Color','blue')
subplot(2,4,4)
plotResiduals(model_5Set3Task2_Cat,'caseorder')
subplot(2,4,5)
plotResiduals(model_5Set3Task2_Cat,'symmetry')
subplot(2,4,6)
%plotInteraction(model_1Set1Task1,'session','Response','predictions')
plotInteraction(model_5Set3Task2_Cat,'Response','Category','predictions')
subplot(2,4,7)
plotInteraction(model_5Set3Task2_Cat,'session','Category','predictions')
subplot(2,4,8)
plot(model_5Set3Task2_Cat)