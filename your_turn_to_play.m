function [player_index_output, player_card_after, card_to_be_played] = your_turn_to_play(player_index_input, previous_card_array,magnitude_input, style_input, player_card, clover3_tik)

whos_turn = find(player_index_input==1);

    if clover3_tik ==1 
        %only clover3
        player_index_output = [0,0,0,0];
        player_index_output(loop1234(whos_turn)) = 1;
        all_options = Playable_options(player_card, magnitude_input, style_input);
        for i = length(all_options):-1:1
            temp_array = all_options{i};
            if temp_array(1)==0
                all_options(i)=[];
            end
        end
        card_to_be_played = all_options{randi(length(all_options),1)};
        [magnitude, style] = Card_array_info(card_to_be_played );
        style_output = style;
        player_card_after = Play_Card(player_card, card_to_be_played);
        
    else


        % means all others pass, restart new round
        if style_input == 0
            player_index_output = [0,0,0,0];
            player_index_output(loop1234(whos_turn)) = 1;

            all_options = Playable_options(player_card, magnitude_input, style_input);
            card_to_be_played = all_options{randi(length(all_options),1)};
            [magnitude, style] = Card_array_info(card_to_be_played );
            style_output = style;
            player_card_after = Play_Card(player_card, card_to_be_played);
        else 
            disp('follow previous')
            all_options = Playable_options(player_card,magnitude_input, style_input);
            card_to_be_played = all_options{randi(length(all_options),1)};
            [magnitude, style] = Card_array_info(card_to_be_played );
            player_card_after = Play_Card(player_card, card_to_be_played);
            player_index_output = player_index_input;

            if player_index_input(loop1234(whos_turn)) == 0
                player_index_output(loop1234(whos_turn))=1;
            elseif player_index_input(loop1234(loop1234(whos_turn))) == 0
                player_index_output(loop1234(loop1234(whos_turn)))=1;
            elseif player_index_input(loop1234(loop1234(loop1234(whos_turn)))) == 0
                player_index_output(loop1234(loop1234(loop1234(whos_turn))))=1;
            end

            if sum(card_to_be_played) ==0
                player_index_output(whos_turn)=2;
            else
                player_index_output(whos_turn)=0;
            end

        end
    end

end