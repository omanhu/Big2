function total_option = Find_Playable_Fullhouses(player_card, magnitude)
    total_option{1} = zeros(1,52);

        if length(player_card)>=5
            for i = 1:13
                if sum(player_card([4*i-3:4*i])) >= 3
                    array_index1 = find(player_card([4*i-3:4*i]));
                    pair_options1 = nchoosek(array_index1,3);
                    [number_of_option1, width1] = size(pair_options1);
                    for l = 1:number_of_option1
                        temp_array = zeros(1,52);
                        temp_array( 4*(i-1) + pair_options1(l,:)) = 1;
                        temp_save_array = player_card([4*i-3:4*i]);
                        player_card([4*i-3:4*i]) = 0;
                        for j = 1:13
                            if sum(player_card([4*j-3:4*j])) >= 2
                                array_index2 = find(player_card([4*j-3:4*j]));
                                pair_options2 = nchoosek(array_index2,2);
                                [number_of_option2, width2] = size(pair_options2);
                                for k = 1: number_of_option2
                                    playable_card_array = temp_array;
                                    playable_card_array(4*(j-1)+pair_options2(k,:)) = 1;
                                    total_option{length(total_option)+1} = playable_card_array;
                                    clear playable_card_array 
                                end
                            end
                        end
                        player_card([4*i-3:4*i])=temp_save_array;
                    end
                end   
            end
        end

    total_option(1)=[];
    for i = length(total_option):-1:1
        [magnitude2, style2] = Card_array_info(total_option{i});
        if magnitude > magnitude2
            total_option(i)=[];
        end
    end
end