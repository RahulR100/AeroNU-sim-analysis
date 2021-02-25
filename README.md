# AeroNU-sim-analysis

Analyse data after solidworks parateric sim analysis  
**NOTE: This requires matlab v2020a or greater to be installed!!**

---
### Usage guide:
1. Take simulation results (`.xlsx` only) and dump them in `input_data`
2. Open `main.m` and change `num_variables` to the number of variables analysed in the parametric study
3. Edit `coarseCalc()` and `fineCalc()` as necessary. Read documentation for each below:
    1. [`coarseCalc()` documentation](https://github.com/RahulR100/AeroNU-sim-analysis/blob/main/docs/coarseCalc.md)
    2. [`fineCalc()` documentation](https://github.com/RahulR100/AeroNU-sim-analysis/blob/main/docs/fineCalc.md)
4. Run `main.m` and look for data in `output_data` with the current timestamp

---
### Useful functions provided:
1. `makegraph(x, y, x_label, y_label)` &#8594; graph
2. `reducer(headers, data)` &#8594; higher order table