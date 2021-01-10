%look in input_data folder
%import data from every file into its own table and give it a tag with the
%name of the file

function impData = importdat()

    srcFiles = dir("input_data/*.xlsx");
    numEntries = length(srcFiles);
    impData = cell(1, numEntries);

    for i = 1:numEntries
        fileName = srcFiles(i).name;
        impData{i} = struct(regexprep(fileName(1:end-5), ' ', '_'), readtable(append("input_data/", fileName), "Sheet", "Parametric Study"));
    end

end