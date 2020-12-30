%import data from combined results file

input_file = "input_data/Combined results.xlsx";

rootdata  = xlsread(input_file, "B3:CS25");
spandata  = xlsread(input_file, "B29:DI51");
sweepdata = xlsread(input_file, "B55:DI77");
tipdata   = xlsread(input_file, "B81:DY103");
widthdata = xlsread(input_file, "B107:BM129");

%now analyse the data

%find all instances for each mach val and aoa
%then sort that data (now an array of arrays)
%then graph all results for all values (now an array of graphs)

%and now graph it