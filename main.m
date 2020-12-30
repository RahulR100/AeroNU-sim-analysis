%import data from combined results file

rootdata  = xlsread("Combined results.xlsx", "B3:CS25");
spandata  = xlsread("Combined results.xlsx", "B29:DI51");
sweepdata = xlsread("Combined results.xlsx", "B55:DI77");
tipdata   = xlsread("Combined results.xlsx", "B81:DY103");
widthdata = xlsread("Combined results.xlsx", "B107:BM129");

%now analyse the data

%find all instances for each mach val and aoa
%then sort that data (now an array of arrays)
%then graph all results for all values (now an array of graphs)

%and now graph it