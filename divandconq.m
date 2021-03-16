%given a table of data sort the data based on a set of other variables

%key header numbers - these deal with which variables are thought to be in
%which rows, and has great consequence for how the data is analyzed




function sortedData = divandconq(tableData, numVars)

    %the following are the rows that each of the three variables is
    %contained in. For example, the lowest level variable (AoA) is
    %contained in row 2. This is an alternative to hard coding the order
    %and having to switch row order in the excel file
    
    %lowest = 2; %the lowest level of calculation will be performed based on this - the slope calc (in this case AoA)
    %primary = 3; %this is the primary variable of interest - in this case the geometric variable
    %tertiary = 1; %this is the least important of the variables and will be analyzed least - in this case mach number

    lowest = 3;
    primary = 1; %for the span results
    tertiary = 2;
    
    

    numVars = numVars - 1; %very sneaky but necessary correction
    
    %lowestRow = tableData(row:row,column:column) - grab the row of the
    %lowest level of data (AoA)
    lowestRow = tableData(lowest,1:2);
    headRows = [tableData{primary,2}; tableData{tertiary,2}];

    rowNames = [tableData{lowest, 1}; tableData{(numVars + 2:height(tableData)), 1}];
    
    %sortedData = [[], struct("head", tableData{1:numVars, 2}, "data", [tableData((numVars + 1):height(tableData), 1), tableData((numVars + 1):height(tableData), 2)])]; %head = set values, data = all the other measured values
    sortedData = [[], struct("head", headRows, "data", [tableData((numVars + 2):height(tableData), 1), tableData((numVars + 2):height(tableData), 2)])]; %head = set values, data = all the other measured values
    %the plus 2 gets you past the -1 earlier, and to the actual data in the
    %table
    
    %size(lowestRow)
    %size(sortedData.data)
    %sortedData.data = vertcat(lowestRow, sortedData.data); % ; gives vertical concatenation, while , gives horizontal
    sortedData.data = [lowestRow; sortedData.data];
    
    
    
    %note this iterates through width not height
    for i = 3:width(tableData) %1 is variable names and 2 has already been dealt with in sortedData initialisation
        
        newHead = [tableData{primary, i}; tableData{tertiary, i}];
        
        designPoint = {convertStringsToChars(strcat('Design Point', num2str(i-1)))};
        newData = table([tableData{lowest, i}; tableData{(numVars + 2):height(tableData), i}], 'VariableNames', designPoint);
        
        similar = false;
        for j = 1:length(sortedData) %iterates through height
           
            %if isequal(tableData{1:numVars, i}, sortedData(j).head)
            if isequal(newHead, sortedData(j).head) % if the headers are equal
                %sortedData(j).data = [sortedData(j).data, tableData((numVars + 1):height(tableData), i)];
                %sortedData(j).data = [sortedData(j).data, tableData{lowest, i}; tableData{(numVars + 2):height(tableData), i}]; %simply append data
                sortedData(j).data = [sortedData(j).data, newData];
                similar = true;
                break; %only using this and not |similar| does not work for some reason
            end %end if
            
        end %end for (j)
        
        if similar == false %else create new sub-table
            
            %sortedData = [sortedData, struct("head", tableData{1:numVars, i}, "data", [tableData((numVars + 1):height(tableData), 1), tableData((numVars + 1):height(tableData), i)])]; 
            
            %newLowestRow = [tableData{lowest,1),tableData{lowest,i}]
            
            newData = [rowNames, newData]; %looks like it grows every loop but in reality it gets reset to a value each iteration
            
            sortedData = [sortedData, struct("head", newHead, "data", newData)]; 

        end %end if
        
    end %end for (i)
     
    sortedData.head;
    sortedData(1:3).data;
    
    
end %end function