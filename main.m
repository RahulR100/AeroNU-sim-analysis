%STEP 1: very imporant global constant
%SET equal to the number of variables we have

%just gonna add this here
clear;

numVars = 3;

%STEP 2: import data from input_data folder

combinedData = importdat();

%STEP 3: now analyse the data using divide and conquer

for i = 1:length(combinedData)
    individualData = struct2cell(combinedData{1, i});
    tableData = individualData{2, 1};
    %I believe in the next line individualData{2, 1} could be replaced with
    %tableData as that is how it is defined
    combinedData{1, i} = struct("name", individualData{1, 1}, "data", divandconq(individualData{2, 1}, numVars), "keys", {reshape(tableData{1:(numVars - 1), 1}, 1, [])});
end %end for

%COMBINED STEPS:
%STEP 4A: create basic output folder structure, prepare to graph
%STEP 4B: graph all results for all values
%STEP 4C: save everything to appropriate folder in output_data

root = "output_data"; %can change but dont recommend
currDate = strrep(datestr(datetime), ':', '_'); %set here to ensure it is constant for all iterations

for i = 1:length(combinedData)
    dat = combinedData{1, i}.data;
    keys = combinedData{1, i}.keys;
    fineCalcResults = [];
    finalRes = [];
    
    %this loop iterates through the different xlsx files - root chord, tip
    %chord, etc. and calculates the results for each
    for j = 1:length(dat)
        folderName = append(root, "/", currDate, "/", combinedData{1, i}.name, "/fine/", namefolder(keys, reshape(dat(j).head', 1, [])));
        fineCalcResults = [fineCalcResults, finecalc(dat(j), folderName)]; %!! THIS IS THE FUNCTION YOU EDIT TO PERFORM CALCULATIONS AT THE FINEST LEVEL
    end %end for (j)
    
    folderName = append(root, "/", currDate, "/", combinedData{1, i}.name, "/coarse");
    res = coarsecalc(keys, dat, fineCalcResults, folderName); %!! THIS FUNCTION USES THE FINE CALC RESULTS TO PERFORM CALCULATIONS AT A HIGHER LEVEL
    finalRes = [finalRes, res];
    
    %store the fineCalcResults into an array instead of wiping them
    slopeResults{i} = fineCalcResults;
end %end for (i)



%% post processing to get the final mesh plot


% 
% %Code for one mesh plot
% base = [combinedData{1,5}.data.head];
% 
% values = slopeResults(5);
% values = values{1}; %cells are bullshit
% 
% [baseX, baseY] = meshgrid([base(1,1),base(1,5),base(1,9),base(1,13)],base(2,1:4));
% 
% %figure;
% 
% mesh(baseX,baseY,[values(1:4);values(5:8);values(9:12);values(13:16)])
% 






%% variable code for different meshes

% fileNum = 1; %can be 1-5 for different .xslx results: root chord, span, sweep, tip chord, width
% numMachs = 4;
% 
% %swap = [1,2]; %this is the normal order, if it needs to be swapped then use the line below
% swap = [2,1]; %if the header lines for the base need to be swapped
% 
% base = [combinedData{1,fileNum}.data.head];
% 
% values = slopeResults(fileNum);
% values = values{1}; %cells are bullshit, change my mind
% 
% finalValues = zeros(numMachs,length(base)/numMachs);
% 
% baseGeometric = zeros(floor(length(base)/numMachs),1);
% %for loop to generate the base array for the geometric variable
% for i = 1:numMachs:length(base)
%     
%     baseGeometric((i+3)/numMachs) = base(swap(2),i);
%     %baseGeometric((i+3)/4) = base(2,i); % nevermind this is fine
% 
%     
%     finalValues(:,(i+3)/numMachs) = values(i:i+3);
%     
% end
% 
% 
% 
% %[baseX, baseY] = meshgrid([base(1,1),base(1,5),base(1,9),base(1,13)],base(2,1:4));
% 
% [baseX, baseY] = meshgrid(baseGeometric,base(swap(1),1:numMachs));
% 
% valuesPerRadian = finalValues * (pi/180); %yes it is pi/180 because we are converting from 1/rad to 1/deg
% 
% %figure;
% 
% %mesh(baseX,baseY,finalValues)
% 
% %axis([0, max(max(baseX)), 0, max(max(baseY)), 0, max(max(rad_vals))]);
% 
% 
% %axes('Position', [0, max(max(baseX)), 0, max(max(baseY)), 0, max(max(rad_vals))])
% 
% mesh(baseX,baseY,valuesPerRadian)
% 
% set(gca, 'XLim', [0,max(max(baseX))], 'YLim', [0,max(max(baseY))]);
% 
% 
% %two(three) issues - the values are in force per radian instead of force
% %per degree (arbitrary really)
% %these are calculated using the normal force instead of the GG force
% %the values matrix is flipped with respect to the base (in terms of the
% %geometric variable, not Mach No.)
% 






%% variable code for different meshes
numMachs = 4;

tiledlayout(2,3);


baseX = {};
baseY = {};
valuesPerRadian = {};


for fileNum = 1:length(combinedData) %iterates through .xslx results: root chord, span, sweep, tip chord, width
    
    nexttile;
    
    swap = [2,1]; %if the header lines for the base need to be swapped
    
    base = [combinedData{1,fileNum}.data.head];
    
    values = slopeResults(fileNum);
    values = values{1}; %cells are bullshit, change my mind
    
    finalValues = zeros(numMachs,length(base)/numMachs); %initialize matrices
    baseGeometric = zeros(floor(length(base)/numMachs),1);
    
    %for loop to generate the base array for the geometric variable
    for i = 1:numMachs:length(base)
        
        baseGeometric((i+3)/numMachs) = base(swap(2),i);
        
        finalValues(:,(i+3)/numMachs) = values(i:i+3);
        
    end
    
    [baseX{fileNum}, baseY{fileNum}] = meshgrid(baseGeometric,base(swap(1),1:numMachs));
    
    valuesPerRadian{fileNum} = finalValues * (pi/180); %yes it is pi/180 because we are converting from 1/rad to 1/deg
    
    mesh(baseX{fileNum},baseY{fileNum},valuesPerRadian{fileNum})
    
    set(gca, 'XLim', [0,max(max(baseX{fileNum}))], 'YLim', [0,max(max(baseY{fileNum}))], 'Zlim',[0,max(max(valuesPerRadian{fileNum}))]);
    
    title(strrep(combinedData{fileNum}.name, '_', ' '));
    
    zlabel("Key output");
    
    xlabel("Geometric Variable")
    
    ylabel("Mach Number");
    
    
end




%swap = [1,2]; %this is the normal order, if it needs to be swapped then use the line below

%two(three) issues - the values are in force per radian instead of force
%per degree (arbitrary really)
%these are calculated using the normal force instead of the GG force
%the values matrix is flipped with respect to the base (in terms of the
%geometric variable, not Mach No.)








