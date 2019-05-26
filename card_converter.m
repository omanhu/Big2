function card_cell = card_converter(player_card_array)

if sum(player_card_array) ==0
        card_cell{1} = 'pass';
    else
        tik=1;
        for i=1:52
            if player_card_array(i)==1

                card_number = num2str(floor((i-1)/4)+3);


                if floor((i-1)/4)+3 == 11
                    card_number = 'J';
                elseif floor((i-1)/4)+3 == 12
                    card_number = 'Q';
                elseif floor((i-1)/4)+3 == 13
                    card_number = 'K';
                elseif floor((i-1)/4)+3 == 14
                    card_number = 'A';
                elseif floor((i-1)/4)+3 == 15
                    card_number = '2';            
                else
                    card_number = num2str(floor((i-1)/4)+3);
                end


                if rem(i,4)==1
                    card_cell{tik} = ['C',card_number];
                elseif rem(i,4)==2
                    card_cell{tik} = ['D',card_number];
                elseif rem(i,4)==3
                    card_cell{tik} = ['H',card_number];
                else
                    card_cell{tik} = ['S',card_number];
                end




                tik = tik+1;
            end
        end 

    end


end