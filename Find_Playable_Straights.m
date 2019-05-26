function total_option = Find_Playable_Straights(player_card, magnitude)
    total_option{1} = zeros(1,52);

        if sum(player_card)>=5
            temp_array([1:8]) = player_card([45:52]);
            temp_array([9:56]) = player_card([1:48]);
            for i = 1:14
                containing_number(i) = sum(temp_array([4*i-3:4*i]));
            end
            for i = 1:10
                if containing_number(i)>0 & containing_number(i+1)>0 & containing_number(i+2)>0 & containing_number(i+1)>0 & containing_number(i+3)>0 & containing_number(i+4)>0     
                    card1_index = find(temp_array([4*(i+0)-3:4*(i+0)]));
                    card2_index = find(temp_array([4*(i+1)-3:4*(i+1)]));
                    card3_index = find(temp_array([4*(i+2)-3:4*(i+2)]));
                    card4_index = find(temp_array([4*(i+3)-3:4*(i+3)]));
                    card5_index = find(temp_array([4*(i+4)-3:4*(i+4)]));
                    
                    for j=1:containing_number(i)
                        for k=1:containing_number(i+1)
                            for l=1:containing_number(i+2)
                                for m=1:containing_number(i+3)
                                    for n=1:containing_number(i+4)
                                        temp_playable_card_array = zeros(1,56);
                                        temp_playable_card_array((i+0-1)*4+card1_index(j)) = 1;
                                        temp_playable_card_array((i+1-1)*4+card2_index(k)) = 1;
                                        temp_playable_card_array((i+2-1)*4+card3_index(l)) = 1;
                                        temp_playable_card_array((i+3-1)*4+card4_index(m)) = 1;
                                        temp_playable_card_array((i+4-1)*4+card5_index(n)) = 1;
                                        if card1_index(j) ~= card2_index(k) | card1_index(j) ~= card3_index(l) | card1_index(j) ~= card4_index(m) | card1_index(j) ~= card5_index(n) 
                                            for o = 1:4
                                                if temp_playable_card_array(52+o) == 1
                                                    temp_playable_card_array(o) = 1;
                                                end
                                            end
                                            playable_card_array = zeros(1,52);
                                            playable_card_array([1:44]) = temp_playable_card_array([9:52]);
                                            playable_card_array([45:52]) = temp_playable_card_array([1:8]);
                                            if Card_array_info(playable_card_array)>magnitude
                                                total_option{length(total_option)+1} = playable_card_array;
                                            end
                                        end
                                    end
                                end
                            end
                        end
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