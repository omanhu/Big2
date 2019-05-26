clc
clear all
close all

% 3333 = 1 2 3 4, 2222 = 49 50 51 52

% 0. Any
% 1. Single
% 2. Pair
% 3. Straight
% 4. Full_House
% 5. Four_Card
% 6. Straight_Flush


[player1,player2,player3,player4] = card_distribution;
player1=[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1];
player2=[0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0];
player3=[0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0];
player4=[0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,1,0,0,0];

player_index_input = who_has_C3(player1,player2,player3,player4);
previous_card_array = zeros(1,52);
clover3_tik = 1;
Record_all_played_card = zeros(1,52);
Record_played1_played_card = zeros(1,52);
Record_played2_played_card = zeros(1,52);
Record_played3_played_card = zeros(1,52);
Record_played4_played_card = zeros(1,52);

Record_tik = 1;
% Record_set{1} = big_round
% Record_set{2} = small_round
% Record_set{3} = current_player_index
% Record_set{4} = Current play
% Record_set{5} = Record_all_played_card
% Record_set{6} = Record_played1_card
% Record_set{7} = Record_played2_card
% Record_set{8} = Record_played3_card
% Record_set{9} = Record_played4_card

% player_index
% 1 = your turn to play
% 0 = not your turn, but you have right to play
% 2 = You've passed


% Start to play
disp('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA')

big_round = 0;
while sum(player1)>0 | sum(player2)>0 | sum(player3)>0 | sum(player4)>0 
    big_round = big_round + 1;
    small_round = 1;
    style_input=0;
    magnitude_input=0;
    previous_card_array =0;
    % 1st play %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if player_index_input(1)==1 & sum(player_index_input)==1
            player_card = player1;
            disp('Player1 play, start new round')
        elseif player_index_input(2)==1 & sum(player_index_input)==1
            player_card = player2;
            disp('Player2 play, start new round')
        elseif player_index_input(3)==1 & sum(player_index_input)==1
            player_card = player3;
            disp('Player3 play, start new round')
        elseif player_index_input(4)==1 & sum(player_index_input)==1
            player_card = player4;
            disp('Player4 play, start new round')
        end


        
%Choose to play%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if player_index_input(1)==1    
            [player_index_output, player_card_after_play, card_to_be_played] = your_turn_to_play2(player_index_input, previous_card_array,magnitude_input, style_input, player_card,clover3_tik);    
        else
            [player_index_output, player_card_after_play, card_to_be_played] = your_turn_to_play2(player_index_input, previous_card_array,magnitude_input, style_input, player_card,clover3_tik);    
        end
%Choose to play%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        

    clover3_tik=0;
    
    disp(card_converter(card_to_be_played))
    [magnitude_output, style_output] = Card_array_info(card_to_be_played);
    if style_output >= style_input 
        style_input = style_output;
        magnitude_input = magnitude_output;
    end
    if magnitude_output >= magnitude_input
        magnitude_input = magnitude_output;
    end

    
% Record + conversion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

    Record_all_played_card = Record_all_played_card + card_to_be_played;
    if player_index_input(1)==1
        player1 = player_card_after_play;
        Record_played1_played_card = Record_played1_played_card + card_to_be_played;
    elseif player_index_input(2)==1
        player2 = player_card_after_play;
        Record_played2_played_card = Record_played2_played_card + card_to_be_played;
    elseif player_index_input(3)==1
        player3 = player_card_after_play;
        Record_played3_played_card = Record_played3_played_card + card_to_be_played;
    else
        player4 = player_card_after_play;
        Record_played4_played_card = Record_played4_played_card + card_to_be_played;
    end
    
    
    
    Record_set{Record_tik,1} = big_round;
    Record_set{Record_tik,2} = small_round;
    Record_set{Record_tik,3} = player_index_input;
    Record_set{Record_tik,4} = card_to_be_played;
    Record_set{Record_tik,5} = Record_all_played_card;
    Record_set{Record_tik,6} = Record_played1_played_card;
    Record_set{Record_tik,7} = Record_played2_played_card;
    Record_set{Record_tik,8} = Record_played3_played_card;
    Record_set{Record_tik,9} = Record_played4_played_card;  
    Record_set{Record_tik,10} = player1;  
    Record_set{Record_tik,11} = player2;  
    Record_set{Record_tik,12} = player3;      
    Record_set{Record_tik,13} = player4;  
    
    player_index_input = player_index_output;
    
    Record_tik = Record_tik + 1;
% Record + conversion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check if game is over %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    if sum(player1)==0 | sum(player2)==0 | sum(player3)==0 | sum(player4)==0
        break
    end
% Check if game is over %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New round 1st play %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    
    while sum(player_index_input([5:8]))<3      
        if player_index_input(1)==1
            player_card = player1;
            disp('Player1 play, follow previous')
        elseif player_index_input(2)==1
            player_card = player2;
            disp('Player2 play, follow previous')
        elseif player_index_input(3)==1
            player_card = player3;
            disp('Player3 play, follow previous')
        else
            player_card = player4;
            disp('Player4 play, follow previous')
        end
        
%Choose to play%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
        [player_index_output, player_card_after_play, card_to_be_played] = your_turn_to_play2(player_index_input, previous_card_array,magnitude_input, style_input, player_card,0);    
%Choose to play%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        



        disp(card_converter(card_to_be_played))
        [magnitude_output, style_output] = Card_array_info(card_to_be_played);        
        if style_output >= style_input 
            style_input = style_output;
            magnitude_input = magnitude_output;
        end
        if magnitude_output >= magnitude_input
            magnitude_input = magnitude_output;
        end        
        

        
        
        
% Record + conversion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Record_all_played_card = Record_all_played_card + card_to_be_played;
        if player_index_input(1)==1
            player1 = player_card_after_play;
            Record_played1_played_card = Record_played1_played_card + card_to_be_played;
        elseif player_index_input(2)==1
            player2 = player_card_after_play;
            Record_played2_played_card = Record_played2_played_card + card_to_be_played;
        elseif player_index_input(3)==1
            player3 = player_card_after_play;
            Record_played3_played_card = Record_played3_played_card + card_to_be_played;
        else
            player4 = player_card_after_play;
            Record_played4_played_card = Record_played4_played_card + card_to_be_played;
        end

        small_round = small_round + 1;
        Record_set{Record_tik,1} = big_round;
        Record_set{Record_tik,2} = small_round;
        Record_set{Record_tik,3} = player_index_input;
        Record_set{Record_tik,4} = card_to_be_played;
        Record_set{Record_tik,5} = Record_all_played_card;
        Record_set{Record_tik,6} = Record_played1_played_card;
        Record_set{Record_tik,7} = Record_played2_played_card;
        Record_set{Record_tik,8} = Record_played3_played_card;
        Record_set{Record_tik,9} = Record_played4_played_card;  
        Record_set{Record_tik,10} = player1;  
        Record_set{Record_tik,11} = player2;  
        Record_set{Record_tik,12} = player3;      
        Record_set{Record_tik,13} = player4;  
        player_index_input = player_index_output;
        Record_tik = Record_tik + 1;
% Record + conversion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Check if game is over %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if sum(player1)==0 | sum(player2)==0 | sum(player3)==0 | sum(player4)==0
            break
        end
% Check if game is over %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     player_index_input = [0,0,0,0,0,0,0,0];
     player_index_input(find(player_index_output([1:4])==1))=1;

% Check if game is over %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    if sum(player1)==0 | sum(player2)==0 | sum(player3)==0 | sum(player4)==0
        break
    end
% Check if game is over %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
end









% Game over
if sum(player1)==0
    disp('Player1 WIN')
elseif sum(player2)==0
    disp('Player2 WIN')
elseif sum(player3)==0
    disp('Player3 WIN')
elseif sum(player4)==0
    disp('Player4 WIN')
end


% calculate result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
money_array = calculate_result(player1,player2,player3,player4,card_to_be_played)
card_converter(card_to_be_played)
% card_converter(player1)
% card_converter(player2)
% card_converter(player3)
% card_converter(player4)
% calculate result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Save game record %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

file_tik = 1;
current_direction = cd;

while 1
    if isfile([cd '/Training data/test', num2str(file_tik), '.mat'])
         file_tik = file_tik + 1;
    else
         save([cd '/Training data/test', num2str(file_tik), '.mat'],'Record_set')
         break
    end
end

% to do 
% 1. change player_index (from 4 => 8)
% 2. next generate NN
% 3. all human select
