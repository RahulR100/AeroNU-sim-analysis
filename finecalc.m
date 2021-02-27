%given a table of data and its keys, generate a set of graphs for that key
%and then save it

%% HOW TO USE
% Read this first to understand how to use the function

% INPUTS:
% Every time it is called the function is given the following inputs:

% 1) original_data --> The table of data for each value of independent
% variables. The variable list (height) is the same as the input excel
% file. Always iterate over the height of the table. Do not worry about the
% width the program will take care of that for you.

% 2) location --> The location of THE FOLDER in which your graphs will be
% saved. You need to append the "/" to this to enter the folder in your
% loop

% OUTPUTS: 
% Your graph can return 1 thing. EXACTLY 1. This can be an array, a cell, a
% string, a value, anything really. It can also be nothing. Set the return
% type to void and do not declare it. The function will then return
% nothing. All results returned from here can then be used in the coarse
% calculation function.

% You can save things to location. Usually this involves something like
% exportgraphics(location, "/", ...);

%% TEMPLATE
% copy this template when you write your function

%{
function ret = finecalc(original_data, location)

    %extract the data from the original_data struct
    data = original_data.data;

    %make the destination folder if necessary
    mkdir(location)
    
    %process the data here (usually a for loop of some kind) and save it to
    %the appropriate location.
    
    %ret =? return anything you want to 

    %see example below for more detail

end %end function
%}

%% EXAMPLE
% this function graphs every variable in the combinedTable

%{
function ret = finecalc(original_data, location)

    mkdir(location);

    data = original_data.data;
    for i = 2:height(data) %start at 2 as 1 is variable names
        f = gcf; %blank canvas
        plot(data{1, (2:width(data))}, data{i, (2:width(data))});
        ylabel(data{i, 1});
        exportgraphics(f, append(location, "/", strrep(data{i, 1}, '/', '|'), ".png")); %strrep is needed as '/' is reserved character
    end %end for

end %end function
%}

%% DEFINE YOUR FUNCTION HERE:

function ret = finecalc(original_data, location)

    data = original_data.data;
    y = data{11, (2:width(data))} ./ data{10, (2:width(data))};
    x = data{1, (2:width(data))};
    
    mkdir(location);
    
    gph = makegraph(x, y, "AOA", "");
    exportgraphics(gph, append(location, "/fine.png"));
    
    slope = polyfit(x, y, 1);
    
    ret = slope(1);

end %end function