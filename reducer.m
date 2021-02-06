%This function operates like div and conq, except for data that has already
%been divided and conquered. 

function newResults = reducer(oldData, computedData)
    
    sortedData = [];
    
    for i = 1:width(oldData)
        key = oldData{1, i};
        head = key(1);
        
        disp(head);
    end

end