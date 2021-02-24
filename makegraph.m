%given a set of data for the x and y axis and their labels, create and
%return a graph with those values.

function gph = makegraph(x, y, xLabel, yLabel)

    f = gcf; %blank canvas
    plot(x, y);
    xlabel(xLabel);
    ylabel(yLabel);

    gph = f;

end %end function