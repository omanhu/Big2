function [player1,player2,player3,player4] = card_distribution
    deck = randperm(52);
    player1_index = sort(deck([1:13]));
    player2_index = sort(deck([14:26]));
    player3_index = sort(deck([27:39]));
    player4_index = sort(deck([40:52]));
    player1 = zeros(1,52);
    player1(player1_index) = 1; 
    player2 = zeros(1,52);
    player2(player2_index) = 1; 
    player3 = zeros(1,52);
    player3(player3_index) = 1; 
    player4 = zeros(1,52);
    player4(player4_index) = 1; 
    disp('Card distributed.')
end