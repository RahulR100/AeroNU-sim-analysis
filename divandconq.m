%given a table of data sort the data based on a set of other variables

function sorted_data = divandconq(table_data, num_variables)

    num_variables = num_variables - 1; %very sneaky but necessary correction
    sorted_data = [[], struct("head", table_data{1:num_variables, 2}, "data", [table_data((num_variables + 1):height(table_data), 1), table_data((num_variables + 1):height(table_data), 2)])]; %head = set values, data = all the other measured values
    
    for i = 3:width(table_data) %1 is variable names and 2 has already been dealt with in sortedData initialisation
        
        similar = false;
        for j = 1:length(sorted_data)
           
            if isequal(table_data{1:num_variables, i}, sorted_data(j).head)
                sorted_data(j).data = [sorted_data(j).data, table_data((num_variables + 1):height(table_data), i)]; %simply append data
                similar = true;
                break; %only using this and not |similar| does not work for some reason
            end %end if
            
        end %end for (j)
        
        if similar == false %else create new sub-table
            sorted_data = [sorted_data, struct("head", table_data{1:num_variables, i}, "data", [table_data((num_variables + 1):height(table_data), 1), table_data((num_variables + 1):height(table_data), i)])]; 
        end %end if
        
    end %end for (i)
     
end %end function