%given a table of data and its keys, generate a set of graphs for that key
%and then save it

%% HOW TO USE
% Read this first to understand how to use the function

% INPUTS:
% Every time it is called the function is given the following inputs:

% 1) combinedTable --> The table of data for each value of independent
% variables. The variable list (height) is the same as the input excel
% file. Always iterate over the height of the table. Do not worry about the
% width the program will take care of that for you.

% 2) location --> The location of THE FOLDER in which your graphs will be
% saved. You need to append the "/" to this to enter the folder in your
% loop

% OUTPUTS:
% Your graph should not return anything. i.e. the value of void should be
% unset.. therefore void

% Save your file to location. Usually this involves something like
% exportgraphics(location, "/", ...);

%% TEMPLATE
% copy this template when you write your function

%{
function void = coarsecalc(fineResults, location)

    %extract the data from the combinedTable
    data = combinedTable.data;
    
    %process the data here (usually a for loop of some kind) and save it to
    %the appropriate location.
    
    %see example below for more detail

end %end function
%}

%% EXAMPLE
% this function graphs every variable in the combinedTable

%{
function void = coarsecalc(fineResults, location)

    data = combinedTable.data;
    for i = 2:height(data) %start at 2 as 1 is variable names
        f = gcf; %blank canvas
        plot(data{1, (2:width(data))}, data{i, (2:width(data))});
        ylabel(data{i, 1});
        exportgraphics(f, append(location, "/", strrep(data{i, 1}, '/', '|'), ".png")); %strrep is needed as '/' is reserved character
    end %end for

end %end function
%}

%% DEFINE YOUR FUNCTION HERE:

function void = coarsecalc(fineResults, location)

    data = fineResults.data;
    

end %end function