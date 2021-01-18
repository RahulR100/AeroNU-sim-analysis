%given particular variable keys, generate a folder name

function namefolder = namefolder(keys, data)

    namefolder = "";
    for i = 1:length(keys) %simple loop to go through keys and return a useful folder name
        namefolder = append(namefolder, " ", keys{i}, "-", num2str(data(i)));
    end %end for
    
end %end function