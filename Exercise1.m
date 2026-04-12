clear all;
flip_count = [5, 1000];
average = zeros(1,1000);
for i=5:1000:
  average [i]= calculate_average(coinflip_count);
end
print(average);


function average = calculate_average(coinflip_count)
    #Calculate average over a set of coinfips

    #Initiate

    coinflip_sum = 0;
    coinflip_values = zeros(1,coinflip_count);

    #Mainloop

    for i=1:coinflip_count
        random_number   = rand;
        coinflip_value(i)   = round(random_number);
        coinflip_sum    = coinflip_sum + coinflip_values(i);
    end

    average = coinflip_sum/coinflip_count;
end