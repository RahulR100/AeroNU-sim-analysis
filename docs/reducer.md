## Documentation for `reducer()`

[Return to home](https://github.com/RahulR100/AeroNU-sim-analysis)

---
### Signature:

`reducer(headers, fine_results)`

### Input:

1. `headers`: Unlike `keys` which you may see in `coarseCalc()`, `headers` stores the value (in the same order) as `keys` of the variables in `keys`. So, going back to the example where `Fin length --(many)> Angle of Attack --(many)> Mach Number`, then:

`keys`:
| `keys[1]` | `keys[2]` | `keys[num_variables = 3]` |
| :-- | :-- | :-- |
| Fin Length | Angle of Attack | Mach Number |

`headers`:
`[fin_length_value, aoa_value, mach_value]`

2. `fine_results`: This is the array of results stored as a result of calling `fineCalc()`. What this array contains is entirely up to you and depends on the return value of `res` in `fineCalc()`.

### Process:

So what does the reducer do?
When you run a fine calc, you change the values of the lowest level data in the `original_data` table. The structure therefore will now look something like this:

originally:  
`Fin length --(many)> Angle of Attack --(many)> Mach number --(one)> table(variables vs raw_data)`

after `fineCalc()`:  
`Fin length --(many)> Angle of Attack --(many)> Mach number --(one)> computed_data`

This structure of data is not compatible for further processing using either another `fineCalc()` run or a `coarseCalc()` run or any combination of those (see program flow docs for a better idea on this)

In order to change the strucure of the table for future calculations, we use `reducer()`. `reducer()` changes the structure of the data like this:

after `fineCalc()`:  
`Fin length --(many)> Angle of Attack --(many)> Mach number --(one)> computed_data`

after `reducer()` on this table:  
`Fine length --(many)> Angle of Attack --(one)> table(Mach number vs computed_data)`

Note the relationship changes (`many` to `one`) as well as the new table created to hold the `computed_data`

### Output:

The result of calling `reducer()` is a modified `original_data` table which can be used for further processing. Note in the example above we "lost" or "combined" one of the lowest levels in the table. Thus, the return value is considered a *higher order table* whereas the original table is considered a *lower order table*. 