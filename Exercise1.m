clc, clearvars

% Input variables

number_of_coinflips = 10000;

%Initialization

%Calculation of mean estimator

mean_estimator = calculate_mean_estimator(number_of_coinflips);

mean_estimator

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