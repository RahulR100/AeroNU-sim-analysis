## Documentation for `coarseCalc()`

[Return to home](https://github.com/RahulR100/AeroNU-sim-analysis)  
For more documentation on `reducer()`, see [here](https://github.com/RahulR100/AeroNU-sim-analysis/blob/main/docs/reducer.md)

---
### Signature:

`coarseCalc(keys, original_data, fine_results, location)` &#8594; `?`

### Input:

1. `keys`: These are the variable names for each level of analysis. This is an array such that `keys[1]` is the highest level of analysis and `keys[num_variables]` is the lowest level. Below is a table of an example.

In a state where: `Fin length --(many)> Angle of Attack --(many)> Mach Number`, then:

| `keys[1]` | `keys[2]` | `keys[num_variables = 3]` |
| :-- | :-- | :-- |
| Fin Length | Angle of Attack | Mach Number |

2. `original_data`: This is the original computed data with raw, unprocessed data from all levels. This data is useful when trying to access raw values for calculation or when extracting headers for the reducer.

`original_data.headers` &#8594; headers to feed the reducer.  
`original_data.data` &#8594; struct with all raw data.

3. `fine_results`: An array of results from all fine calculations performed by `fineCalc()`. This is your lower level data which you should be manipulating in this function, perhaps with the use of a for loop. What this array contains is entirely dependent on how you defined `fineCalc()`

4. `location`: Location to a folder where you want to save anything, be it data or graphs. Note that saving data to this location will require appending a `/` to the end of `location`.

Note that the directory is not automatically created for you. This is done on purpose to avoid creating thousands of empty directories when not required. Hence, simply use `mkdir(location)` to make the directory for you.

### Output:

Your function can output up to 1 object. To output more than 1 object, consider the use of an array or struct as appropriate.  
To return something, set the value of `ret` to that object.