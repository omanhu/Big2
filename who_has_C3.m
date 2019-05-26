function player_index = who_has_C3(player1,player2,player3,player4)
    player_index = [0,0,0,0,0,0,0,0];

    if player1(1)==1
        player_index(1)=1;
        disp('Player1 has clover 3.')
    elseif player2(1)==1
        player_index(2)=1;
        disp('Player2 has clover 3.')
    elseif player3(1)==1
        player_index(3)=1;
        disp('Player3 has clover 3.')
    else
        player_index(4)=1;
        disp('Player4 has clover 3.')
    end

end