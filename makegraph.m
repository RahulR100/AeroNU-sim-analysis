%given a table of data and its keys, generate a set of graphs for that key
%and then save it

function x = makegraph(combinedTable, location)

data = combinedTable.data;

for i = 2:height(data)
   
    f = gcf;
    plot(data{1, (2:width(data))}, data{i, (2:width(data))});
    ylabel(strrep(data{i, 1}));
    exportgraphics(f, append(location, "/", strrep(data{i, 1}, '/', '|'), ".png"));
    
    
end

end