## Documentation for `fineCalc()`

[Return to home](https://github.com/RahulR100/AeroNU-sim-analysis)

### Signature:

`fineCalc(original_data, location)` &#8594; `?`

### Input:

1. `original_data`: This is the original computed data with raw, unprocessed data from all levels. This is the data that you will most likely be processing.

`original_data.headers` &#8594; headers.  
`original_data.data` &#8594; struct with all raw data.

2. `location`: Location to a folder where you want to save anything, be it data or graphs. Note that saving data to this location will require appending a `/` to the end of `location`.

Note that the directory is not automatically created for you. This is done on purpose to avoid creating thousands of empty directories when not required. Hence, simply use `mkdir(location)` to make the directory for you.

### Output:

Your function can output up to 1 object. To output more than 1 object, consider the use of an array or struct as appropriate.  
To return something, set the value of `ret` to that object.