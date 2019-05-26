function money_array = calculate_result(player1,player2,player3,player4,card_to_be_played)
    All_card{1} = player1;
    All_card{2} = player2;
    All_card{3} = player3;
    All_card{4} = player4;

    if sum(player1) == 0
        winner_index = 1;
    elseif sum(player2) == 0
        winner_index = 2;
    elseif sum(player3) == 0
        winner_index = 3;
    else
        winner_index = 4;
    end
        
    for i = 1:4
        temp_card_array = All_card{i};
        double_times = 2^( sum(temp_card_array([49:52])));
        Four_card_options = 0;
        if length(Addition_4card_options(temp_card_array))>0
            double_times = double_times *2;
        end
        if length(Addition_RoyalFlush_options(temp_card_array))>0
            double_times = double_times *2;
        end
        if sum(temp_card_array) >= 10
            double_times = double_times*2;
        end
        money_array(i) = -sum(All_card{i})* double_times;
    end
    
    money_array(winner_index) = -sum(money_array);
    
    
    if Card_array_info(card_to_be_played) > 48
        money_array = money_array * 2;
    end
    
    
end
