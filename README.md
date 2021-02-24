# AeroNU-sim-analysis

Analyse data after solidworks parateric sim analysis

**NOTE: This requires matlab v2020a or greater to be installed!!**

---
### Usage guide:
1. Take simulation results (`.xlsx` only) and dump them in `input_data`
2. Open `main.m` and change `numVars` to the number of variables analysed in the parametric study
3. Edit `coarseCalc` and `fineCalc` as necessary. Read documentation for each below:
    1. coarseCalc documentation
    2. fineCalc documentation
4. Run `main.m` and look for data in `output_data` with the current timestamp

---
### Useful functions provided:
1. `makegraph(x, y, xLabel, yLabel)` &#8594; graph
2. `reducer(headers, data)` &#8594; higher order table