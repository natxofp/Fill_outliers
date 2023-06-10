# Fill_outliers

[![Build Status](https://github.com/natxofp/Fill_outliers.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/natxofp/Fill_outliers.jl/actions/workflows/CI.yml?query=branch%3Amain)

This packages finds the outliers in a vector and fills them with a linear interpolation between closest non outlier/NaN/missing neighbours.

Three different methods are implemented to find the outliers:
- `mean`: Outliers are those values that are 3 times the standard deviation, `std`, away from the mean.
- `quartiles`: Outliers are those values that are outside the 25 and 75 quartile.
- `move mean`: Outliers are those values that are 3 times the standard deviation, `std`, away from the moving mean. In that case the window size is `window` and needs to be provided as input.

Example: 
fill_outliers(data, method, window)
    data = [1, 2, 100000, 4, 5, 7, 9, 15, NaN, 8, 9]
    method = "mean"
    # mean method
    expected_mean = [1.0, 2.0, 100000.0, 4.0, 5.0, 7.0, 9.0, 15.0, 11.5, 8.0, 9.0]

    method = "quartiles"
    # quartiles method
    expected_quartiles = [1.0, 2.0, 3.0, 4.0, 5.0, 7.0, 9.0, 15.0, 11.5, 8.0, 9.0]

    method = "moving_mean"
    window = 3
    # moving mean method
    expected_moving_mean = [1.0, 2.0, 100000.0, 4.0, 5.0, 7.0, 9.0, 15.0, 11.5, 8.0, 9.0]