%some constantsis
numVars = 3;

%import data from combined results file

combinedData = importdat();

%now analyse the data

%find all instances for each mach val and aoa
%then sort that data (now an array of arrays)

for i = 1:length(combinedData)
    individualData = struct2cell(combinedData{1, i});
    combinedData{1, i} = struct("name", individualData{1, 1}, "data", divandconq(individualData{2, 1}, numVars));
end

%then graph all results for all values (now an array of graphs)

%and now save it
