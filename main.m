%STEP 1: very imporant global constant
%SET equal to the number of variables we have

num_variables = 3;

%STEP 2: import data from input_data folder

original_data = importdat();

%STEP 3: now analyse the data using divide and conquer

for i = 1:length(original_data)
    individual_data = struct2cell(original_data{1, i});
    table_data = individual_data{2, 1};
    original_data{1, i} = struct("name", individual_data{1, 1}, "data", divandconq(individual_data{2, 1}, num_variables), "keys", {reshape(table_data{1:(num_variables - 1), 1}, 1, [])});
end %end for

%COMBINED STEPS:
%STEP 4A: create basic output folder structure, prepare to graph
%STEP 4B: graph all results for all values
%STEP 4C: save everything to appropriate folder in output_data

root = "output_data"; %can change but dont recommend
current_date = strrep(datestr(datetime), ':', '_'); %set here to ensure it is constant for all iterations

for i = 1:length(original_data)
    dat = original_data{1, i}.data;
    keys = original_data{1, i}.keys;
    fine_calc_results = [];
    final_results = [];
    
    for j = 1:length(dat)
        folder_name = append(root, "/", current_date, "/", original_data{1, i}.name, "/fine/", namefolder(keys, reshape(dat(j).head', 1, [])));
        fine_calc_results = [fine_calc_results, finecalc(dat(j), folder_name)]; %!! THIS IS THE FUNCTION YOU EDIT TO PERFORM CALCULATIONS AT THE FINEST LEVEL
    end %end for (j)
    
    folder_name = append(root, "/", current_date, "/", original_data{1, i}.name, "/coarse");
    coarse_result = coarsecalc(keys, dat, fine_calc_results, folder_name); %!! THIS FUNCTION USES THE FINE CALC RESULTS TO PERFORM CALCULATIONS AT A HIGHER LEVEL
    final_results = [final_results, coarse_result];
end %end for (i)
