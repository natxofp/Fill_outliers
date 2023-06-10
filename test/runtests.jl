using Fill_outliers
using Test

@testset "Fill_outliers.jl" begin
    # Test data with missing and outlier values
    data = [1, 2, 100000, 4, 5, 7, 9, 15, NaN, 8, 9]

    # Test mean method
    expected_mean = [1.0, 2.0, 100000.0, 4.0, 5.0, 7.0, 9.0, 15.0, 11.5, 8.0, 9.0]
    @test fill_outliers(data, "mean") ≈ expected_mean atol = 1e-6

    # Test quartiles method
    expected_quartiles = [1.0, 2.0, 3.0, 4.0, 5.0, 7.0, 9.0, 15.0, 11.5, 8.0, 9.0]
    @test fill_outliers(data, "quartiles") ≈ expected_quartiles

    # Test moving mean method
    expected_moving_mean = [1.0, 2.0, 100000.0, 4.0, 5.0, 7.0, 9.0, 15.0, 11.5, 8.0, 9.0]
    @test fill_outliers(data, "moving_mean") ≈ expected_moving_mean
end
tes