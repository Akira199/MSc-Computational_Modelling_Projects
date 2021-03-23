%% Starting point bias check

               %% %%%%%%%%%%%%%%%%%%%%%%%%%%% Correct RT data %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Index out the category - 1
load('Final_Right Skew Data_SwitchingPictorial.mat')

cat_1Cor = Final_SwitchPicData_switching(Final_SwitchPicData_switching.category ==1,...
                                    {'code','session','condition','set','task',...
                                        'stimuli','response','rt','category'});
SET_1Category1 = cat_1Cor(cat_1Cor.set == 'fruit_size',:);
task_1Set1_category1 = SET_1Category1(SET_1Category1.task == 'fruit',:);
                                    
                               
% Calculating meanRTs - correct RT's dataset: Category 1
idxSs_cat1 = table();
idxRT_cat1 = table();
meanRTCor_St1Task1_Category1= cell(4,31);
for mm = 1:31
       idxSs_cat1 = task_1Set1_category1(task_1Set1_category1.code == mm,:);
       for zz = 1:4
       idxRT_cat1 = idxSs_cat1(idxSs_cat1.session == zz,{'rt'});
       rt = table2array(idxRT_cat1);
       calcMean = mean(rt);
       meanRTCor_St1Task1_Category1{zz,mm} = calcMean;
       end
end

%%
% Index out the category - 2
cat_2Cor = Final_SwitchPicData_switching(Final_SwitchPicData_switching.category ==2,...
                                    {'code','session','condition','set','task',...
                                    'stimuli','response','rt','category'});
SET_1Category2 = cat_2Cor(cat_2Cor.set == 'fruit_size',:);
task_1Set1_category2 = SET_1Category2(SET_1Category2.task == 'fruit',:);


% Calculating meanRTs - correct RT's dataset: Category 2
idxSs_cat2 = table();
idxRT_cat2 = table();
meanRTCor_St1Task1_Category2= cell(4,31);
for mm = 1:31
       idxSs_cat2 = task_1Set1_category2(task_1Set1_category2.code == mm,:);
       for zz = 1:4
       idxRT_cat2 = idxSs_cat2(idxSs_cat2.session == zz,{'rt'});
       rt = table2array(idxRT_cat2);
       calcMean = mean(rt);
       meanRTCor_St1Task1_Category2{zz,mm} = calcMean;
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
SET_1Category_1_Incor = cat_1InCor(cat_1InCor.set == 'fruit_size',:);
task_1Set1_category1Incor = SET_1Category_1_Incor(SET_1Category_1_Incor.task == 'fruit',:);

% Calculating meanRTs - Incorrect RT's dataset: Category 1
idxSs_cat1Incor = table();
idxRT_cat1Incor = table();
meanRT_St1Task1_Category1Incor= cell(4,31);
for mm = 1:31
       idxSs_cat1Incor = task_1Set1_category1Incor(task_1Set1_category1Incor.code == mm,:);
       for zz = 1:4
       idxRT_cat1Incor = idxSs_cat1Incor(idxSs_cat1Incor.session == zz,{'rt'});
       rt = table2array(idxRT_cat1Incor);
       calcMean = mean(rt);
       meanRT_St1Task1_Category1Incor{zz,mm} = calcMean;
       end
end
%%
% Index out the category - 2
cat_2InCor = switchDataIncorr(switchDataIncorr.category ==2,...
                                    {'code','session','condition','set','task',...
                                    'stimuli','response','rt','category'});
SET_1Category_2_Incor = cat_2InCor(cat_2InCor.set == 'fruit_size',:);
task_1Set1_category2Incor = SET_1Category_2_Incor(SET_1Category_2_Incor.task == 'fruit',:);


% Calculating meanRTs - correct RT's dataset: Category 2
idxSs_cat2Incor = table();
idxRT_cat2Incor = table();
meanRT_St1Task1_Category2Incor= cell(4,31);
for mm = 1:31
       idxSs_cat2Incor = task_1Set1_category2Incor(task_1Set1_category2Incor.code == mm,:);
       for zz = 1:4
       idxRT_cat2Incor = idxSs_cat2Incor(idxSs_cat2Incor.session == zz,{'rt'});
       rt = table2array(idxRT_cat2Incor);
       calcMean = mean(rt);
       meanRT_St1Task1_Category2Incor{zz,mm} = calcMean;
       end
end

%% Convert all Incor MEAN RT values to NaN if the corresponding values for Cor MEAN RT is NaN:

% Category - 1: Correct and Incorrect Data: 

meanRTCor_St1Task1_Category1 = cell2mat(meanRTCor_St1Task1_Category1);
meanRT_St1Task1_Category1Incor = cell2mat(meanRT_St1Task1_Category1Incor);
for hh = 1:124 %the idx range has to be 4*31  
  if isnan(meanRTCor_St1Task1_Category1(hh))
      meanRT_St1Task1_Category1Incor(hh) = NaN;
  end 
end


% Category - 2: Correct and Incorrect Data:
meanRTCor_St1Task1_Category2 = cell2mat(meanRTCor_St1Task1_Category2);
meanRT_St1Task1_Category2Incor = cell2mat(meanRT_St1Task1_Category2Incor);
for hh = 1:124 %the idx range has to be 4*31  
  if isnan(meanRTCor_St1Task1_Category2(hh))
     meanRT_St1Task1_Category2Incor(hh) = NaN;
  end 
end

% Compile mean rt data from correct and incorrect set across Category -1&2
compile_MeanRts_category = [meanRTCor_St1Task1_Category1;meanRT_St1Task1_Category1Incor;...
                   meanRTCor_St1Task1_Category2;meanRT_St1Task1_Category2Incor];
% remove Ss 
compile_MeanRts_category(:,31) = [];
compile_MeanRts_category(:,29) = [];
compile_MeanRts_category(:,28) = [];
compile_MeanRts_category(:,27) = [];
compile_MeanRts_category(:,7) = [];
compile_MeanRts_category(:,6) = [];
compile_MeanRts_category(:,3) = [];
compile_MeanRts_category(:,2) = [];

 Fin_MeanRt_category = compile_MeanRts_category(:);
 
 %% Data prep for linear Regression for set-1 and task-1: 

% Define the variables for the final dataset: 

SS_1Cat = repmat({1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,...
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
               20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,...
               21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,...
               22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,...
               23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,...
               24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,...
               25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,...
               26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,...
               30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30},1,1)';
code = cell2mat(SS_1Cat);
%%            
sess = repmat({1,2,3,4,...
               1,2,3,4},1,46)';
session = cell2mat(sess);


resp = repmat({1,1,1,1,...
               2,2,2,2},1,46)'; 
response = cell2mat(resp);
%dumyResponse = dummyvar(response);
               
condition =  repmat({'switch','switch','switch','switch',...
                     'switch','switch','switch','switch'},1,46)';
 
set = repmat({'fruit_set','fruit_set','fruit_set','fruit_set',...
              'fruit_set','fruit_set','fruit_set','fruit_set'},1,46)';

task = repmat({'fruit','fruit','fruit','fruit',...
              'fruit','fruit','fruit','fruit',},1,46)';

stimuli = repmat({'pictorial','pictorial','pictorial','pictorial',...
                  'pictorial','pictorial','pictorial','pictorial',},1,46)';
              
MeanRT_cat = Fin_MeanRt_category;

cat = repmat({1,1,1,1,1,1,1,1,...
              2,2,2,2,2,2,2,2},1,23)'; 
category = cell2mat(cat);

% Assemble the final dataset: 
Set1_task1_switchingPicFinal = table(code,session,condition,set,task,stimuli,...
                        response,MeanRT_cat,category,...
                        'VariableNames',{'code','session','condition','set',...
                         'task','stimuli','response','MeanRT_cat','category'});
                     
%% Liner Regression

Set1_task1_switchingPicFinal.Category = categorical(category);
Set1_task1_switchingPicFinal.Response = categorical(response);
model_1Set1Task1_Cat = fitlm(Set1_task1_switchingPicFinal,...
                            'MeanRT_cat~session*Category*Response')
model_1ANOVA_Set1Task1_Cat = anova(model_1Set1Task1_Cat,'summary')                     

% Plotting the Residuals

figure (33)
sgtitle ({'Switching Pictorial','Set - Fruit & Size','Task1 - Fruit'})
subplot(2,4,1)
plotResiduals(model_1Set1Task1_Cat,'probability','Color','red')
subplot(2,4,2)
plotResiduals(model_1Set1Task1_Cat,'fitted','Color','green')
subplot(2,4,3)
plotResiduals(model_1Set1Task1_Cat,'lagged','Color','blue')
subplot(2,4,4)
plotResiduals(model_1Set1Task1_Cat,'caseorder')
subplot(2,4,5)
plotResiduals(model_1Set1Task1_Cat,'symmetry')
subplot(2,4,6)
%plotInteraction(model_1Set1Task1,'session','Response','predictions')
plotInteraction(model_1Set1Task1_Cat,'Response','Category','predictions')
subplot(2,4,7)
plotInteraction(model_1Set1Task1_Cat,'session','Category','predictions')
subplot(2,4,8)
plot(model_1Set1Task1_Cat)

                     
                     