%given a table of data and its keys, generate a set of graphs for that key
%and then save it

function void = makegraph(combinedTable, location)

    data = combinedTable.data;
    for i = 2:height(data) %start at 2 as 1 is variable names
        f = gcf; %blank canvas
        plot(data{1, (2:width(data))}, data{i, (2:width(data))});
        ylabel(data{i, 1});
        exportgraphics(f, append(location, "/", strrep(data{i, 1}, '/', '|'), ".png")); %strrep is needed as '/' is reserved character
    end %end for

end %end function