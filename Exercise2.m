clc, clearvars

% Coinflip variables

minimum_flips     = 6;
maximum_flips     = 10000;
number_of_samples = maximum_flips - minimum_flips + 1;
coinflips         = minimum_flips:maximum_flips;

%Initialization

mean_estimator = zeros(1,number_of_samples);

%Calculation of mean estimator

for i=1:number_of_samples
    
    mean_estimator(i) = calculate_mean_estimator(coinflips(i));
    
    i = i+1;
end

mean_estimator;

% Plotting estimator vs actual mean curve

actual_mean = 0.5;
plot(coinflips, mean_estimator)

function mean_estimator = calculate_mean_estimator(number_of_coinflips)

    % Initialization of variables

    coinflip_sum = 0;
    coinflip_values = zeros(1,number_of_coinflips);

    % Assigning random values and summing them up

    for i=1: number_of_coinflips
        
        temporary_coinflip_value  = rand;
        coinflip_values(i)        = round(temporary_coinflip_value);
        coinflip_sum              = coinflip_sum + coinflip_values(i);

        i = i+1;
    end

    % Calculation of the estimator value
    mean_estimator = coinflip_sum/number_of_coinflips;

end