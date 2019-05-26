function total_option = Find_Playable_Pairs(player_card, magnitude)

    total_option{1} = zeros(1,52);

        for i = 1:13
            temp_array = zeros(1,52);
            temp_array([i*4-3:i*4]) = player_card([i*4-3:i*4]);
            if sum(temp_array) == 2
                if Card_array_info(temp_array) > magnitude
                    total_option{length(total_option)+1} = temp_array;
                end
            elseif sum(temp_array) == 3
                temp_array_index=find(temp_array);
                Combinations = nchoosek(temp_array_index,2);
                for j = 1:3
                    temp_array = zeros(1,52);
                    temp_array(Combinations(j,:)) = 1;
                    if Card_array_info(temp_array) > magnitude
                        total_option{length(total_option)+1} = temp_array;
                    end
                end
            elseif sum(temp_array) == 4
                temp_array_index=find(temp_array);
                Combinations = nchoosek(temp_array_index,2);
                for j = 1:6
                    temp_array = zeros(1,52);
                    temp_array(Combinations(j,:)) = 1;
                    if Card_array_info(temp_array) > magnitude
                        total_option{length(total_option)+1} = temp_array;
                    end
                end
            end
        end
        total_option(1)=[];
end