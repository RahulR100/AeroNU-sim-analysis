%STEP 1: very imporant global constant
numVars = 3;

%STEP 2: import data from input_data folder

combinedData = importdat();

%STEP 3: now analyse the data using divide and conquer

for i = 1:length(combinedData)
    individualData = struct2cell(combinedData{1, i});
    combinedData{1, i} = struct("name", individualData{1, 1}, "data", divandconq(individualData{2, 1}, numVars));
end

%STEP 4: create basic output folder structure, prepare to graph

%STEP 5: graph all results for all values (now an array of graphs)

%STEP 6: now save everything to output_data
