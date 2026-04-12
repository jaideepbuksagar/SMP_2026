clc, clearvars

% Coinflip variables

minimum_flips     = 6;
maximum_flips     = 10000;
number_of_samples = maximum_flips - minimum_flips + 1;
coinflips         = minimum_flips:maximum_flips;

%Initialization

mean_estimator = zeros(1,number_of_samples);
varience       = zeros(1,number_of_samples);

%Calculation of mean estimator

for i=1:number_of_samples
    
    [mean_estimator(i), varience(i)] = calculate_mean_and_varience(coinflips(i));
    
    i = i+1;
end

mean_estimator;

% Plotting estimator vs actual mean curve

actual_mean = 0.5;
%plot(coinflips, mean_estimator)
plot(coinflips, varience)

function [mean_estimator, varience] = calculate_mean_and_varience(number_of_coinflips)

    % Initialization of variables

    coinflip_sum    = 0;
    coinflip_values = zeros(1,number_of_coinflips);
    total_deviation = 0;

    % Assigning random values and summing them up

    for i=1: number_of_coinflips
        
        temporary_coinflip_value  = rand;
        coinflip_values(i)        = round(temporary_coinflip_value);
        coinflip_sum              = coinflip_sum + coinflip_values(i);

        i = i+1;
    end

    % Calculation of the estimator value
    mean_estimator = coinflip_sum/number_of_coinflips;
    
    for j=1: number_of_coinflips
        deviation = coinflip_values(j) - mean_estimator;
        total_deviation = total_deviation + deviation^2;
        
        j = j + 1;
    end

    varience = total_deviation/number_of_coinflips;
end