%look in input_data folder
%import data from every excel file into its own table and give it a tag with the
%name of the file

function impData = importdat()

    srcFiles = dir("input_data/*.xlsx"); %read only .xlsx files
    numEntries = length(srcFiles);
    impData = cell(1, numEntries);

    for i = 1:numEntries
        fileName = srcFiles(i).name;
        if contains(fileName, "~") == false %now you can have the file open and run this at the same time yay!
            impData{i} = struct("name", regexprep(fileName(1:end-5), ' ', '_'), "data", readtable(append("input_data/", fileName), "Sheet", "Parametric Study"));
        end
    end %end for

end %end function