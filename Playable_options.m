function total_option = Playable_options(player_card, magnitude, style)
    
%%%    
    
%     disp('magnitude')
%     disp(magnitude)
%     disp('style')
%     disp(style)

    total_option{1} = zeros(1,52);
    
    
    if style == 1 
        total_option1 = Find_Playable_Singles(player_card, magnitude); 
        for i = 1:length(total_option1)
            total_option{length(total_option)+1} = total_option1{i};
        end
        % Adding 4card and straight flush
        if magnitude <=51
            Addition_4card_option = Addition_4card_options(player_card);
            for i = 1:length(Addition_4card_option)
                total_option{length(total_option)+1} = Addition_4card_option{i};
            end
            Addition_RoyalFlush_option = Addition_RoyalFlush_options(player_card);
            for i = 1:length(Addition_RoyalFlush_option)
                total_option{length(total_option)+1} = Addition_RoyalFlush_option{i};
            end
        end        
    elseif style == 2
        total_option2 = Find_Playable_Pairs(player_card, magnitude);
        for i = 1:length(total_option2)
            total_option{length(total_option)+1} = total_option2{i};
        end
        % Four Card + Royal Flush
        Addition_4card_option = Addition_4card_options(player_card);
        for i = 1:length(Addition_4card_option)
            total_option{length(total_option)+1} = Addition_4card_option{i};
        end
        Addition_RoyalFlush_option = Addition_RoyalFlush_options(player_card);
        for i = 1:length(Addition_RoyalFlush_option)
            total_option{length(total_option)+1} = Addition_RoyalFlush_option{i};
        end 
        
    elseif style == 3
        total_option3 = Find_Playable_Straights(player_card, magnitude);
        for i = 1:length(total_option3)
            total_option{length(total_option)+1} = total_option3{i};
        end
        % Four Card + Royal Flush
        Addition_4card_option = Addition_4card_options(player_card);
        for i = 1:length(Addition_4card_option)
            total_option{length(total_option)+1} = Addition_4card_option{i};
        end
        Addition_RoyalFlush_option = Addition_RoyalFlush_options(player_card);
        for i = 1:length(Addition_RoyalFlush_option)
            total_option{length(total_option)+1} = Addition_RoyalFlush_option{i};
        end
        
        
    elseif style == 4 % full house
        total_option4 = Find_Playable_Fullhouses(player_card, magnitude);
        for i = 1:length(total_option4)
            total_option{length(total_option)+1} = total_option4{i};
        end
        Addition_4card_option = Addition_4card_options(player_card);
        for i = 1:length(Addition_4card_option)
            total_option{length(total_option)+1} = Addition_4card_option{i};
        end
        Addition_RoyalFlush_option = Addition_RoyalFlush_options(player_card);
        for i = 1:length(Addition_RoyalFlush_option)
            total_option{length(total_option)+1} = Addition_RoyalFlush_option{i};
        end
        
        
        
        
        
    elseif style == 5
        for i=1:13
            if sum( player_card( [i*4-3:i*4])) == 4
                if i*4 > magnitude
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

        Addition_RoyalFlush_option = Addition_RoyalFlush_options(player_card);
        for i = 1:length(Addition_RoyalFlush_option)
            total_option{length(total_option)+1} = Addition_RoyalFlush_option{i};
        end
       
        
    elseif style == 6
        if length(player_card)>=5
            Addition_RoyalFlush_option = Addition_RoyalFlush_options(player_card);
            for i = 1:length(Addition_RoyalFlush_option)
                if Card_array_info(Addition_RoyalFlush_option{i})> magnitude
                    total_option{length(total_option)+1} = Addition_RoyalFlush_option{i};
                end
            end
        end
    
    elseif style == 0
        total_option1 = Find_Playable_Singles(player_card, magnitude);
        for i = 1:length(total_option1)
            total_option{length(total_option)+1} = total_option1{i};
        end
        total_option2 = Find_Playable_Pairs(player_card, magnitude);
        for i = 1:length(total_option2)
            total_option{length(total_option)+1} = total_option2{i};
        end
        total_option3 = Find_Playable_Straights(player_card, magnitude);
        for i = 1:length(total_option3)
            total_option{length(total_option)+1} = total_option3{i};
        end
        total_option4 = Find_Playable_Fullhouses(player_card, magnitude);
        for i = 1:length(total_option4)
            total_option{length(total_option)+1} = total_option4{i};
        end
        Addition_4card_option = Addition_4card_options(player_card);
        for i = 1:length(Addition_4card_option)
            total_option{length(total_option)+1} = Addition_4card_option{i};
        end
        Addition_RoyalFlush_option = Addition_RoyalFlush_options(player_card);
        for i = 1:length(Addition_RoyalFlush_option)
            total_option{length(total_option)+1} = Addition_RoyalFlush_option{i};
        end
        total_option(1)=[];
    end
% 0. Any
% 1. Single
% 2. Pair
% 3. Straight
% 4. Full_House
% 5. Four_Card
% 6. Royal_Flush    
    
end
