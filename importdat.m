%look in input_data folder
%import data from every excel file into its own table and give it a tag with the
%name of the file

function imported_data = importdat()

    src_files = dir("input_data/*.xlsx"); %read only .xlsx files
    num_entries = length(src_files);
    imported_data = cell(1, num_entries);

    for i = 1:num_entries
        file_name = src_files(i).name;
        if contains(file_name, "~") == false %now you can have the file open and run this at the same time yay!
            imported_data{i} = struct("name", regexprep(file_name(1:end-5), ' ', '_'), "data", readtable(append("input_data/", file_name), "Sheet", "Parametric Study"));
        end
    end %end for

end %end function