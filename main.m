%STEP 1: very imporant global constant
%SET equal to the number of variables we have

numVars = 3;

%STEP 2: import data from input_data folder

combinedData = importdat();

%STEP 3: now analyse the data using divide and conquer

for i = 1:length(combinedData)
    individualData = struct2cell(combinedData{1, i});
    tableData = individualData{2, 1};
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
    for j = 1:length(dat)
        folderName = append(root, "/", currDate, "/", combinedData{1, i}.name, "/", namefolder(combinedData{1, i}.keys, reshape(dat(j).head', 1, [])));
        mkdir(folderName);
        makegraph(dat(j), folderName); %!! THIS IS THE FUNCTION YOU EDIT TO GET NEW GRAPHS
    end %end for (j)
end %end for (i)
