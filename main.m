%STEP 1: very imporant global constant
numVars = 3;

%STEP 2: import data from input_data folder

combinedData = importdat();

%STEP 3: now analyse the data using divide and conquer

for i = 1:length(combinedData)
    individualData = struct2cell(combinedData{1, i});
    tableData = individualData{2, 1};
    combinedData{1, i} = struct("name", individualData{1, 1}, "data", divandconq(individualData{2, 1}, numVars), "keys", {reshape(tableData{1:(numVars - 1), 1}, 1, [])});
end

%STEP 4: create basic output folder structure, prepare to graph

root = "output_data";
currDate = strrep(datestr(datetime), ':', '_');
%mkdir(append(root, currDate));

for i = 1:length(combinedData)
    %mkdir(append(root, currDate, combinedData{1, i}.name));
    dat = combinedData{1, i}.data;
    for j = 1:length(dat)
        mkdir(append(root, "/", currDate, "/", combinedData{1, i}.name, "/", num2str(reshape(dat(j).head', 1, []))));
    end
end

%STEP 5: graph all results for all values

%STEP 6: now save everything to output_data
