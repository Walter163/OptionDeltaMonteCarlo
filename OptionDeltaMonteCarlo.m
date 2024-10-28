clear all;
clc;
close all;

%% MONTE CARLO OPTION PRICING METHOD

% This script implements the Monte Carlo method for pricing European call options
% using the Black-Scholes model. The delta of the option is also calculated 
% using finite difference approximations.

%% INPUT PARAMETERS

% Input initial data for option pricing
S0 = input('Enter the initial price of the asset S0: '); % Initial price of the underlying asset
K = input('Enter the strike price K: '); % Strike price of the call option
r = input('Enter the risk-free interest rate r: '); % Annual risk-free interest rate
sigma = input('Enter the volatility sigma: '); % Annual volatility of the underlying asset
T = input('Enter the maturity time T (in years): '); % Time until the option expiration in years
N_values = input('Enter a vector with sample sizes N (e.g. [100 1000 10000]): '); % Vector containing sample sizes to analyze
h_values = input('Enter a vector with increment values h (e.g. [0.01 0.001 0.0001]): '); % Vector containing increment values for delta calculation

num_h = length(h_values); % Number of increments h to analyze
num_N = length(N_values); % Number of sample sizes to analyze

%% MONTE CARLO BASE METHOD

% Create a matrix to store delta values calculated with the base method
Valori_delta_base = zeros(num_h, num_N); 

% Calculate DELTA for each combination of increments h and sample sizes N
for j = 1:num_h
    h = h_values(j); % Select the current increment h for the iteration
    
    for n_idx = 1:num_N
        N = N_values(n_idx); % Select the number of trajectories to simulate for this iteration
        delta_values = zeros(N, 1); % Vector to store delta values calculated for each trajectory

        for k = 1:N
            Z = randn; % Generate a random number from a standard normal distribution
            
            % Calculate the price of the underlying S using the Black-Scholes model formula
            S = S0 * exp((r - 0.5 * sigma^2) * T + sigma * sqrt(T) * Z); 
            % Calculate the price of the underlying S_h with an increment h
            S_h = (S0 + h) * exp((r - 0.5 * sigma^2) * T + sigma * sqrt(T) * Z); 
            
            % Calculate the discounted payoff at the risk-free rate for the call option
            V = max(S - K, 0) * exp(-r * T); % Payoff of the call option for S
            V_h = max(S_h - K, 0) * exp(-r * T); % Payoff of the call option for S_h
            
            % Calculate the delta for the current trajectory using the finite difference formula
            delta_values(k) = (V_h - V) / h;
        end
        
        % Calculate the mean of deltas for the current increment h and save in the matrix
        Valori_delta_base(j, n_idx) = mean(delta_values); 
    end
end

%% RESULTS DISPLAY

% Display results for the base method
disp('Calculated Delta Values:');
disp(Valori_delta_base); % Print delta values calculated

%% PLOTTING RESULTS

% Create plots for the base method
figure('Name', 'Base Monte Carlo Method'); % Create a new figure for the plot
for n_idx = 1:num_N
    subplot(num_N, 1, n_idx); % Create a subplot for each sample size
    plot(h_values, Valori_delta_base(:, n_idx), 'o-', 'DisplayName', ['N = ', num2str(N_values(n_idx))]); % Plot delta vs increment h
    title(['Delta Base Method (N = ', num2str(N_values(n_idx)), ')']); % Title for the subplot
    xlabel('Increment h'); % X-axis label
    ylabel('Delta'); % Y-axis label
    legend('show'); % Show legend
    grid on; % Enable grid in the plot
end
sgtitle('Delta Results for the Monte Carlo Method'); % Global title for the figure