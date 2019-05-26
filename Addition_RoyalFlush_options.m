function total_option = Addition_RoyalFlush_options(player_card)
total_option={};

        if sum(player_card)>=5
            temp_array([1:8]) = player_card([45:52]);
            temp_array([9:56]) = player_card([1:48]);

            for i = 1:40
                if sum(temp_array([i,i+4,i+8,i+12,i+16])) == 5
                    temp_playable_card_array = zeros(1,56);
                    temp_playable_card_array([i,i+4,i+8,i+12,i+16])=1;
                    for j=1:4
                        if temp_playable_card_array(52+j)==1
                            temp_playable_card_array(j)=1;
                        end
                    end
                    playable_card_array = zeros(1,52);
                    playable_card_array([1:44]) = temp_playable_card_array([9:52]);
                    playable_card_array([45:52])= temp_playable_card_array([1:8]);
                    total_option{length(total_option)+1} = playable_card_array;    
                end
            end
        end


end