%given a set of data for the x and y axis and their labels, create and
%return a graph with those values.

function gph = makegraph(x, y, x_label, y_label)

    f = gcf; %blank canvas
    plot(x, y);
    xlabel(x_label);
    ylabel(y_label);

    gph = f;

end %end function