function total_option = Find_Playable_Singles(player_card, magnitude)
    
    total_option{1} = zeros(1,52);
    
    temp_array = find(player_card);
    for i=1:length(temp_array)
        playable_card_array = zeros(1,52);
        if temp_array(i)>magnitude
            playable_card_array(temp_array(i))=1;
            total_option{length(total_option)+1} = playable_card_array;
        end
    end

    total_option(1)=[];
end