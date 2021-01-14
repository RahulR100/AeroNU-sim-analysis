%given particular variable keys, generate a folder name

function namefolder = namefolder(keys, data)

    namefolder = "";
    for i = 1:length(keys)
        namefolder = append(namefolder, " ", keys{i}, "-", num2str(data(i)));
    end
    
end