function total_option = Addition_4card_options(player_card)
total_option={};
        for i=1:13
            if sum( player_card( [i*4-3:i*4])) == 4
                playable_card_array = zeros(1,52);
                playable_card_array([i*4-3:i*4])=1;
                temp_array = player_card;
                temp_array([i*4-3:i*4]) = 0;
                array_index = find(temp_array);
                for j = 1:sum(temp_array)
                    playable_card_array(array_index(j))=1;
                    total_option{length(total_option)+1} = playable_card_array;
                    playable_card_array(array_index(j))=0;
                end
            end
        end


end