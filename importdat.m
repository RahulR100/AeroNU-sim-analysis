%look in input_data folder
%import data from every excel file into its own table and give it a tag with the
%name of the file

function impData = importdat()

    srcFiles = dir("input_data/*.xlsx");
    numEntries = length(srcFiles);
    impData = cell(1, numEntries);

    for i = 1:numEntries
        fileName = srcFiles(i).name;
        impData{i} = struct("name", regexprep(fileName(1:end-5), ' ', '_'), "data", readtable(append("input_data/", fileName), "Sheet", "Parametric Study"));
    end

end