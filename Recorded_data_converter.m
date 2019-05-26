clc
clear all
close all

Data_folder = [cd, '/Training data/']


[file,path] = uigetfile('*.mat',...
   'Select One or More Files', ...
   'MultiSelect', 'on');

load([path,file])
[total_round, data_size] = size(Record_set);



% player1 card = Record_set{i,10}
% player2 card = Record_set{i,11}
% player3 card = Record_set{i,12}
% player4 card = Record_set{i,13}

% Find_Playable_Fullhouses(player_card, magnitude, style)

for i = 1:total_round
    Feature(i,1) = Record_set{i,1};
    Feature(i,2) = Record_set{i,2};
    Feature(i,[3:6]) = Record_set{i,3}; % need to change
    Feature(i,[7:58]) = Record_set{i,4};
    Feature(i,[59:110]) = Record_set{i,5};
    Feature(i,[111:162]) = Record_set{i,6};
    
    player1_has_fullhouse(i) = isempty(Find_Playable_Fullhouses(Record_set{i,10}, 1, 1));
    player2_has_fullhouse(i) = isempty(Find_Playable_Fullhouses(Record_set{i,11}, 1, 1));
    player3_has_fullhouse(i) = isempty(Find_Playable_Fullhouses(Record_set{i,12}, 1, 1));
    player4_has_fullhouse(i) = isempty(Find_Playable_Fullhouses(Record_set{i,13}, 1, 1));
    % 1 = no fullhouse, 0 = yes fullhouse
    
end
