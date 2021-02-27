%given particular variable keys, generate a folder name

function folder_name = namefolder(keys, data)

    folder_name = "";
    for i = 1:length(keys) %simple loop to go through keys and return a useful folder name
        folder_name = append(folder_name, " ", keys{i}, "-", num2str(data(i)));
    end %end for
    
end %end function