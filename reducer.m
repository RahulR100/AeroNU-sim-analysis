%This function operates like div and conq, except for data that has already
%been divided and conquered. 

function newResults = reducer(oldData, computedData)
    
    sortedData = [[], struct("head", oldData{1, 1}(1), "data", [struct("key", oldData{1, 1}(2), "value", computedData(1))])];
    count = 2;
    
    for i = 2:length(oldData)

        similar = false;
        for j = 1:length(sortedData)           
           
           if isequal(sortedData(j).head, oldData{1, i}(1))
               sortedData(j).data = [sortedData(j).data, struct("key", oldData{1, i}(2), "value", computedData(count))];
               count = count + 1;
               similar = true;
               break;
           end
           
        end
        
        if similar == false
           sortedData = [sortedData, struct("head", oldData{1, i}(1), "data", [struct("key", oldData{1, i}(2), "value", computedData(count))])];
           count = count + 1;
        end
        
    end
    
    newResults = sortedData;
    
end