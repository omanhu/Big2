function [magnitude, style] = Card_array_info(card_array)
% 0. Any
% 1. Single
% 2. Pair
% 3. Straight
% 4. Full_House
% 5. Four_Card
% 6. Royal_Flush
        style=0;



% 0. Any
    if sum(card_array) == 0
        magnitude = 0;
        style = 0;
    
% 1. Single
    elseif sum(card_array)==1
        magnitude = find(card_array);
        style = 1;

% 2. Pair
    elseif sum(card_array)==2
        magnitude = max(find(card_array));
        style = 2;

    
    elseif sum(card_array)==5
% 4. Full_House
% 5. Four_Card
        for i=1:13
            if sum( card_array( [i*4-3:i*4])) == 4
                style = 5;
                magnitude = i*4;
            elseif sum( card_array( [i*4-3:i*4])) == 3
                style = 4;
                magnitude = i*4;
            end
        end
    if style == 5 | style == 4        
        return
    end

    
% 3. Straight
% 6. Royal_Flush        
    card_cell = card_converter(card_array);
    card1 = card_cell{1};
    card2 = card_cell{2};
    card3 = card_cell{3};
    card4 = card_cell{4};
    card5 = card_cell{5}; 
        if card1(1)==card2(1) & card2(1)==card3(1) & card1(1)==card4(1) & card1(1)==card5(1)
            style = 6;
            if sum(card_array([45:52]))==2
                card_array([45:52])=0;
                magnitude = max(find(card_array));
            else 
                magnitude = max(find(card_array));
            end
        else
            style = 3;
            if sum(card_array([45:52]))==2
                card_array([45:52])=0;
                magnitude = max(find(card_array));
            else 
                magnitude = max(find(card_array));
            end
        end

    end
end

