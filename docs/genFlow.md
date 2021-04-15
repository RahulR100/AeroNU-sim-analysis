## General program flow

[Return to home](https://github.com/RahulR100/AeroNU-sim-analysis)

### Purpose

The purpose of this document is to give you a better idea of how the program works and what you can really do with it:

First, a solidworks simulation is run and data is stored in an excel spreadsheet

Data is then read from those excel sheets into the program into a struct of headers and nested tables. Metadata (variable names, units) is separated from the data.

The program runs based on the metadata since the accuracy / size of data cannot be determined beforehand.

The fine calculator is run on each end instance of data. This is then fed into a coarse calculator which aggregates the result of the fine calculation. Then a reducer is run to update the metadata so that the program can run again with the new higher level table. Which each run, one level of data is merged. Once we reach the last level, the results are returned.

Diagrams in progress...