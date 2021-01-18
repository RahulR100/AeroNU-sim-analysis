%given a table of data sort the data based on a set of other variables

function sortedData = divandconq(tableData, numVars)

    numVars = numVars - 1; %very sneaky but necessary correction
    sortedData = [[], struct("head", tableData{1:numVars, 2}, "data", [tableData((numVars + 1):height(tableData), 1), tableData((numVars + 1):height(tableData), 2)])]; %head = set values, data = all the other measured values
    
    for i = 3:width(tableData) %1 is variable names and 2 has already been dealth with in sortedData initialisation
        
        similar = false;
        for j = 1:length(sortedData)
           
            if isequal(tableData{1:numVars, i}, sortedData(j).head)
                sortedData(j).data = [sortedData(j).data, tableData((numVars + 1):height(tableData), i)]; %simply append data
                similar = true;
                break; %only using this and not |similar| does not work for some reason
            end %end if
            
        end %end for (j)
        
        if similar == false %else create new sub-table
            sortedData = [sortedData, struct("head", tableData{1:numVars, i}, "data", [tableData((numVars + 1):height(tableData), 1), tableData((numVars + 1):height(tableData), i)])]; 
        end %end if
        
    end %end for (i)
     
end %end function