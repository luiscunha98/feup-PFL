

:- use_module(library(clpfd)).
:- use_module(library(lists)).

% Define the size of the board
size(9).
:- dynamic p1_positions/1.
:- dynamic p2_positions/1.
:- dynamic player_positions/2.


% Define the initial positions of the pieces
p1_positions([[1,1], [2,7], [3,1], [4,1], [5,1], [6,1], [7,1], [1,8]]).
p2_positions([[1,9], [2,9], [3,9], [4,9], [5,9], [6,9], [7,9], [8,9]]).



% Define the rule for checking if the path is blocked
path_blocked(X, Y, NewX, NewY) :-
  X #< NewX, Y #= NewY, % check if the piece is moving vertically down
  BetweenX in X+1..NewX-1, % generate a list of X coordinates between X and NewX
  player_positions(_, Positions),
  member([BetweenX, Y], Positions). % check if any of the positions between X and NewX are occupied
path_blocked(X, Y, NewX, NewY) :-
  X #> NewX, Y #= NewY, % check if the piece is moving vertically up
  BetweenX in NewX+1..X-1, % generate a list of X coordinates between NewX and X
  player_positions(_, Positions),
  member([BetweenX, Y], Positions). % check if any of the positions between NewX and X are occupied
path_blocked(X, Y, NewX, NewY) :-
  X #= NewX, Y #< NewY, % check if the piece is moving horizontally left
  BetweenY in Y+1..NewY-1, % generate a list of Y coordinates between Y and NewY
  player_positions(_, Positions),
  member([X, BetweenY], Positions). % check if any of the positions between Y and NewY are occupied
path_blocked(X, Y, NewX, NewY) :-
  X #= NewX, Y #> NewY, % check if the piece is moving horizontally right
  BetweenY in NewY+1..Y-1, % generate a list of Y coordinates between NewY and Y
  player_positions(_, Positions),
  member([X, BetweenY], Positions). % check if any of the positions between NewY and Y are occupied





% Define the list of valid moves for a piece
% Move vertical down
valid_move(X, Y, NewX, NewY) :-
  size(S),
  NewX #> X,
  NewY #= Y,
  NewX #> 0, NewX #=< S,
  NewY #> 0, NewY #=< S,
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked

% move vertical up
valid_move(X, Y, NewX, NewY) :-
  size(S),
  NewX #< X ,
  NewY #= Y,
  NewX #> 0, NewX #=< S,
  NewY #> 0, NewY #=< S,
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked

  % move horizontal right
valid_move(X, Y, NewX, NewY) :-
  size(S),
  NewX #= X,
  NewY #> Y,
  NewX #> 0, NewX #=< S,
  NewY #> 0, NewY #=< S,
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked

  % move horizontal left
valid_move(X, Y, NewX, NewY) :-
  size(S),
  NewX #= X,
  NewY #< Y ,
  NewX #> 0, NewX #=< S,
  NewY #> 0, NewY #=< S,
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked




% circular special wana moves

% move circular from row 1
valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from row 1
  ( X #= 1, Y #=> 4, Y #=< 6 ), % from row 1
  ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY#= 9 ; NewY #= 1)); % left and right
  (NewX #=9,( NewY #=4; NewY #=5, NewY #=6)) ; % down
  (NewX #= 1, NewY #=< 6, NewY #=> 4), % right
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% move circular from row 9
valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from row 9
  ( X #= 9, Y #=> 4, Y #=< 6 ), % from row 9
  ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 9 ; NewY #= 1)); % left and right
  (NewX #=9,( NewY #=4; NewY #=5, NewY #=6)) ; % down
  (NewX #= 1, NewY #=< 6, NewY #=> 4), % up
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% move circular from row 2

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from row 2
  ( X #= 2, Y #=> 4, Y #=< 6 ), % from row 2
  ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 8 ; NewY #= 2)); % left and right
  (NewX #=8,( NewY #=4; NewY #=5, NewY #=6)) ; % down
  (NewX #= 2, NewY #=< 6, NewY #=> 4), % up
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% move circular from row 8

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from row 8
  ( X #= 8, Y #=> 4, Y #=< 6 ), % from row 8
  ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 8 ; NewY #= 2)); % left and right
  (NewX #=8,( NewY #=4; NewY #=5, NewY #=6)) ; % down
  (NewX #= 2, NewY #=< 6, NewY #=> 4), % up
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% move circular from row 7

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from row 7
  ( X #= 7, Y #=> 4, Y #=< 6 ), % from row 7
  ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 7 ; NewY #= 3)); % left and right
  (NewX #=7,( NewY #=4; NewY #=5, NewY #=6)) ; % down
  (NewX #= 3, NewY #=< 6, NewY #=> 4), % up
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% move circular from row 3

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from row 3
  ( X #= 3, Y #=> 4, Y #=< 6 ), % from row 3
  ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 7 ; NewY #= 3)); % left and right
  (NewX #=7,( NewY #=4; NewY #=5, NewY #=6)) ; % down
  (NewX #= 3, NewY #=< 6, NewY #=> 4), % up
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% the same as above for rows 1,2,3, 7,8,9 but now for columns 1,2,3, 7,8,9

% move circular from column 1

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from column 1
  ( Y #= 1, X #=> 4, X #=< 6 ), % from column 1
  ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 9 ; NewX #= 1)); % up and down
  (NewY #=9,( NewX #=4; NewX #=5, NewX #=6)) ; % right
  (NewY #= 1, NewX #=< 6, NewX #=> 4), % left
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% move circular from column 9

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from column 9
  ( Y #= 9, X #=> 4, X #=< 6 ), % from column 9
  ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 9 ; NewX #= 1)); % up and down
  (NewY #=9,( NewX #=4; NewX #=5, NewX #=6)) ; % right
  (NewY #= 1, NewX #=< 6, NewX #=> 4), % left
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% move circular from column 7

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from column 7
  ( Y #= 7, X #=> 4, X #=< 6 ), % from column 7
  ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 7 ; NewX #= 3)); % up and down
  (NewY #=7,( NewX #=4; NewX #=5, NewX #=6)) ; % right
  (NewY #= 3, NewX #=< 6, NewX #=> 4), % left
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked



% move circular from column 3

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from column 3
  ( Y #= 3, X #=> 4, X #=< 6 ), % from column 3
  ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 7 ; NewX #= 3)); % up and down
  (NewY #=7,( NewX #=4; NewX #=5, NewX #=6)) ; % right
  (NewY #= 3, NewX #=< 6, NewX #=> 4), % left
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% move circular from column 2

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from column 2
  ( Y #= 2, X #=> 4, X #=< 6 ), % from column 2
  ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 8 ; NewX #= 2)); % up and down
  (NewY #=8,( NewX #=4; NewX #=5, NewX #=6)) ; % right
  (NewY #= 2, NewX #=< 6, NewX #=> 4), % left
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% move circular from column 8

valid_move(X, Y, NewX, NewY) :-
  size(S),
  X#=> 1, X#=< S , X > 0,
  NewX #=> 1, NewX #=< S,  
  % circular movement from column 8
  ( Y #= 8, X #=> 4, X #=< 6 ), % from column 8
  ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 8 ; NewX #= 2)); % up and down
  (NewY #=8,( NewX #=4; NewX #=5, NewX #=6)) ; % right
  (NewY #= 2, NewX #=< 6, NewX #=> 4), % left
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
   \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked



% movements around edges


% Define the rules for moving a piece
move(player_1, X, Y, NewX, NewY) :-
  p1_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY),
  
  p2_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions). % the new position must be empty
move(player_2, X, Y, NewX, NewY) :-
  p2_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY),
  
  p1_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions). % the new position must be empty

% Define the rule for switching players
next_player(player_1, player_2).
next_player(player_2, player_1).

player_positions(player_1, Positions) :- p1_positions(Positions).
player_positions(player_2, Positions) :- p2_positions(Positions).


trapped(Player) :-
  Player = player_1,
  p2_positions(OpponentPositions),
  \+ (member([X,Y], OpponentPositions), move(player_2, X, Y, _, _)).
trapped(Player) :-
  Player = player_2,
  p1_positions(OpponentPositions),
  \+ (member([X,Y], OpponentPositions), move(player_1, X, Y, _, _)). % Define the rule for determining if a player has won

% Define the rule for determining if a player has won
won(Player) :-
  trapped(Player). % player wins if they are not trapped and their opponent is
won(Player) :-
  next_player(Player, Opponent),
  trapped(Opponent). % player wins if their opponent is trapped


 
% Define the rule for deleting an element ( list with pair position) from a list
delete_old_pos(Elem, [Elem|Tail], Tail).
delete_old_pos(Elem, [Head|Tail], [Head|NewTail]) :- delete_old_pos(Elem, Tail, NewTail).

% Define the main game loop
play(Player) :-
  won(Player) , % check if the player has won before the next move
  write('Player '), write(Player), write(', enter your move (X Y NewX NewY): '),
  read(X), read(Y), read(NewX), read(NewY),nl ,

  move(Player, X, Y, NewX, NewY),
  (move(Player, X, Y, NewX, NewY) -> % if the move is valid
    player_positions(Player, Positions),
    delete([X,Y], Positions, NewPositions), % remove the old position of the piece
    retract(player_positions(Player, _)),
    asserta(player_positions(Player, [[NewX,NewY]|NewPositions])),
    won(Player) , % check if the player has won after the move
    next_player(Player, NextPlayer),
    play(NextPlayer) % continue with the next player
  ; % otherwise
  write('Invalid move, try again.'), nl,
  play(Player) % if the move is not valid, ask for a new move from the same player
  ).

display_board(Board) :-
  write('  1 2 3 4 5 6 7 8 9'), nl,
  display_board_rows(Board, 1).

display_board_rows([], _).
display_board_rows([Row|Rows], RowNum) :-
  write(RowNum), write(' '),
  display_board_row(Row),
  write(nl),
  NextRowNum is RowNum + 1,
  display_board_rows(Rows, NextRowNum).

display_board_row([]) :- write('').
display_board_row([Piece|Pieces]) :-
  write(Piece), write(' '),
  display_board_row(Pieces).
% Start the game
:- play(player_1).



