# Monte Carlo Simulation for European Call Options

This repository contains a MATLAB script that implements the Monte Carlo method to calculate the delta of European call options. The project is part of a university assignment related to the course "Mathematical Finance."

## Overview

The script simulates the price of an underlying asset using the Black-Scholes model and estimates the delta of a European call option. Delta is a measure of how much the option's price changes when the underlying asset's price changes. This project aims to provide insights into option pricing and risk management.

## Prerequisites

MATLAB: This script requires MATLAB to run. Ensure you have it installed on your system.

## Inputs

The script takes the following inputs:

1. **S0**: Initial price of the underlying asset.
2. **K**: Strike price of the call option.
3. **r**: Risk-free interest rate (annualized).
4. **sigma**: Volatility of the underlying asset (annualized).
5. **T**: Time to expiration of the option in years.
6. **N_values**: A vector of sample sizes (e.g., `[100 1000 10000]`) to analyze.
7. **h_values**: A vector of increments (e.g., `[0.01 0.001 0.0001]`) used for delta calculations.

### Input Parameter Relationship with DELTA

- **S0**: The initial price (\(S_0\)) of the underlying asset has a direct influence on delta. As \(S_0\) increases, the likelihood of the option finishing in the money also increases, leading to a higher delta value. A higher \(S_0\) typically means that the option is more sensitive to changes in the underlying asset's price, resulting in a delta closer to 1 for in-the-money options.
- **K**: The strike price (\(K\)) affects delta by determining the option's intrinsic value. If \(K\) is low relative to \(S_0\), the option is more likely to be in the money, which generally results in a higher delta. Conversely, if \(K\) is high relative to \(S_0\), the option is more likely to be out of the money, leading to a lower delta. Thus, delta decreases as the strike price increases relative to the underlying asset's price.
- **r**: a higher risk-free interest rate increases the present value of the payoff, affecting the option's price.
- **sigma**: higher volatility increases the uncertainty of the asset's future price, typically raising the option's value.
- **T**: the longer the time until expiration, the greater the chance for the asset price to fluctuate, which can increase the option's value.
- **N_values**: more trajectories yield a more accurate estimate of the delta but increase computation time.
- **h_values**: smaller increments provide a more precise calculation of delta.


## Example

Here is a simple numerical example to illustrate the inputs:

- Initial price of the asset (S0): 100
- Strike price (K): 100
- Risk-free interest rate (r): 0.05 (5%)
- Volatility (sigma): 0.2 (20%)
- Time to expiration (T): 1 year
- Sample sizes (N_values): [1000]
- Increments (h_values): [0.01]

When you run the script with these parameters, it will calculate the delta of the call option based on the simulated asset prices.

## Contributing

If you have any suggestions or improvements for this project, feel free to fork the repository and create a pull request.

## Contact

You can find me on [LinkedIn](https://www.linkedin.com/in/walter-giannattasio-2a2301233/).
