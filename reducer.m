%This function operates like div and conq, except for data that has already
%been divided and conquered. 

function higher_order_table = reducer(headers, fine_results)
    
    reduced_data = [[], struct("head", headers{1, 1}(1), "data", [struct("key", headers{1, 1}(2), "value", fine_results(1))])];
    count = 2;
    
    for i = 2:length(headers)

        similar = false;
        for j = 1:length(reduced_data)           
           
           if isequal(reduced_data(j).head, headers{1, i}(1))
               reduced_data(j).data = [reduced_data(j).data, struct("key", headers{1, i}(2), "value", fine_results(count))];
               count = count + 1;
               similar = true;
               break;
           end
           
        end
        
        if similar == false
           reduced_data = [reduced_data, struct("head", headers{1, i}(1), "data", [struct("key", headers{1, i}(2), "value", fine_results(count))])];
           count = count + 1;
        end
        
    end
    
    higher_order_table = reduced_data;
    
end