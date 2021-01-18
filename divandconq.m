%given a table of data sort the data based on a set of other variables

function sortedData = divandconq(tableData, numVars)

    numVars = numVars - 1;
    sortedData = [[], struct("head", tableData{1:numVars, 2}, "data", [tableData((numVars + 1):height(tableData), 1), tableData((numVars + 1):height(tableData), 2)])];
    
    for i = 3:width(tableData)
        
        similar = false;
        for j = 1:length(sortedData)
           
            if isequal(tableData{1:numVars, i}, sortedData(j).head)
                sortedData(j).data = [sortedData(j).data, tableData((numVars + 1):height(tableData), i)];
                similar = true;
                break;
            end
            
        end
        
        if similar == false
            sortedData = [sortedData, struct("head", tableData{1:numVars, i}, "data", [tableData((numVars + 1):height(tableData), 1), tableData((numVars + 1):height(tableData), i)])]; 
        end
        
    end
     
end