

consult('game_logic.pl').

play(Player) :-

  has_lost(Player), % check if the current player has lost
  next_player(Player, NextPlayer), % get the next player because the current player has lost
  write('Player: '), write(NextPlayer), write(' wins!'), nl,
  !. % nextPlayer wins, stop the game
%Define the main game loop
play(Player) :-
    next_player(Player, NextPlayer),
    player_positions(Player, Positions),
    get_current_board(Player,NextPlayer),
    write('Player '), write(Player), write(', enter your move (X Y NewX NewY): '),
    read(X), read(Y), read(NewX), read(NewY),nl,
    write("Player: "),write(Player) ,write(' positions pieces: ') ,write(Positions),nl,
    (move(Player, X, Y, NewX, NewY) -> % if the move is valid
    write('Valid move!'), nl,
    (Player=player_1 ->
    delete_old_pos([X,Y], Positions, NewPositions), % remove the old position of the piece
    retractall(p1_positions(_)),
    asserta(p1_positions([[NewX,NewY]|NewPositions])),
    nl, nl,
    play(NextPlayer);
    delete_old_pos([X,Y], Positions, NewPositions), % remove the old position of the piece
    retractall(p2_positions(_)),
    asserta(p2_positions([[NewX,NewY]|NewPositions])),
    nl, nl,
    play(NextPlayer)
    )
  ; % otherwise
  write('Invalid move, try again.'), nl,
  play(Player) % if the move is not valid, ask for a new move from the same player
  ).


play2(Player) :-

  has_lost(Player), % check if the current player has lost
  next_player_cl_easy_pl(Player, NextPlayer), % get the next player because the current player has lost
  write('Player: '), write(NextPlayer), write(' wins!'), nl,
  !. % nextPlayer wins, stop the game

play2(Player) :-
 Player = player_1,
 next_player_cl_easy_pl(Player, NextPlayer),
 player_positions(Player, Positions),
 get_current_board(Player,NextPlayer),
  write('Player '), write(Player), write(', enter your move (X Y NewX NewY): '),
  read(X), read(Y), read(NewX), read(NewY),nl,
  write("Player: "),write(Player) ,write(' positions pieces: ') ,write(Positions),nl,
  (move(Player, X, Y, NewX, NewY) -> % if the move is valid
    write(Positions),
    delete_old_pos([X,Y], Positions, NewPositions), % remove the old position of the piece
    retractall(p1_positions(_)),
    asserta(p1_positions([[NewX,NewY]|NewPositions])),
    nl, nl,
    play2(NextPlayer) % continue with the next player
  ; % otherwise
  write('Invalid move, try again.'), nl,
  play2(Player) % if the move is not valid, ask for a new move from the same player
  ).
play2(Player) :- 
    Player = cl_easy_1,
    write('Computer player '), write(Player), write(' is playing...'), nl,
    next_player_cl_easy_pl(Player, NextPlayer),
    get_current_board(Player,NextPlayer),
    write(Positions),nl,
    play_random_move(Player, X, Y,NewX,NewY), 
    player_positions(Player, Positions), 
    delete_old_pos([X,Y], Positions, NewPositions),
    retractall(p2_positions(_)),
    asserta(p2_positions([[NewX,NewY]|NewPositions])),
    % change the current player
    next_player_cl_easy_pl(Player, NextPlayer),
    nl, nl,
    play2(NextPlayer).

play3(Player) :-

  has_lost(Player), % check if the current player has lost
  next_player_cl_easy_cl(Player, NextPlayer), % get the next player because the current player has lost
  write('Player: '), write(NextPlayer), write(' wins!'), nl,
  !. % nextPlayer wins, stop the game

play3(Player) :- 
    Player = cl_easy_1,
    write('Computer player '), write(Player), write(' is playing...'), nl,
    next_player_cl_easy_cl(Player, NextPlayer),
    get_current_board(Player,NextPlayer),
    write(Positions),nl,
    play_random_move(Player, X, Y,NewX,NewY), 
    player_positions(Player, Positions), 
    delete_old_pos([X,Y], Positions, NewPositions),
    retractall(p2_positions(_)),
    asserta(p2_positions([[NewX,NewY]|NewPositions])),
    % change the current player
    next_player_cl_easy_cl(Player, NextPlayer),
    nl, nl,
    play3(NextPlayer).

play3(Player) :- 
    Player = cl_easy_2,
    write('Computer player '), write(Player), write(' is playing...'), nl,
    next_player_cl_easy_cl(Player, NextPlayer),
    get_current_board(Player,NextPlayer),
    write(Positions),nl,
    play_random_move(Player, X, Y,NewX,NewY), 
    player_positions(Player, Positions), 
    delete_old_pos([X,Y], Positions, NewPositions),
    retractall(p1_positions(_)),
    asserta(p1_positions([[NewX,NewY]|NewPositions])),
    % change the current player
    next_player_cl_easy_cl(Player, NextPlayer),
    nl, nl,
    play3(NextPlayer).