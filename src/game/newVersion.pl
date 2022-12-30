

:- use_module(library(clpfd)).

% Define the size of the board
size(9).
:- dynamic p1_positions/1.
:- dynamic p2_positions/1.


% Define the initial positions of the pieces
p1_positions([[1,1], [2,1], [3,1], [4,1], [5,1], [6,1], [7,1], [8,1]]).
p2_positions([[1,9], [2,9], [3,9], [4,9], [5,9], [6,9], [7,9], [8,9]]).

% Define the list of valid moves for a piece
% Move vertical down
valid_move(X, Y, NewX, NewY) :-
  size(S),
  NewX #> X,
  NewY #= Y,
  NewX #> 0, NewX #=< S,
  NewY #> 0, NewY #=< S.
% move vertical up
valid_move(X, Y, NewX, NewY) :-
  size(S),
  NewX #< X ,
  NewY #= Y,
  NewX #> 0, NewX #=< S,
  NewY #> 0, NewY #=< S.
  % move horizontal right
valid_move(X, Y, NewX, NewY) :-
  size(S),
  NewX #= X,
  NewY #> Y,
  NewX #> 0, NewX #=< S,
  NewY #> 0, NewY #=< S.
  % move horizontal left
valid_move(X, Y, NewX, NewY) :-
  size(S),
  NewX #= X,
  NewY #< Y ,
  NewX #> 0, NewX #=< S,
  NewY #> 0, NewY #=< S.

% Define the rules for moving a piece
move(player_1, X, Y, NewX, NewY) :-
  p1_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY),
  NewX #\= X | NewY #\= Y, % the piece must move to a different position
  p2_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions). % the new position must be empty
move(player_2, X, Y, NewX, NewY) :-
  p2_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY),
  NewX #\= X | NewY #\= Y, % the piece must move to a different position
  p1_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions). % the new position must be empty

% Define the rule for switching players
next_player(player_1, player_2).
next_player(player_2, player_1).

% Define the rule for determining if a player has won
won(Player) :-
  Player = player_1,
  p2_positions(OpponentPositions),
  \+ (member([X,Y], OpponentPositions), move(player_2, X, Y, _, _)). % player 1 wins if player 2 has no valid moves
won(Player) :-
  Player = player_2,
  p1_positions(OpponentPositions),
  \+ (member([X,Y], OpponentPositions), move(player_1, X, Y, _, _)). % player 2 wins if player 1 has no valid moves

% Define the main game loop
play(Player) :-
  won(Player),
  write('Player '), write(Player), write(' wins!'), nl,
  !. % player wins, stop the game
play(Player) :-
  write('Player '), write(Player), write(', enter your move (X Y NewX NewY): '),
  read(X), read(Y), read(NewX), read(NewY),nl ,
  write('Check '), write(Player), write(', Check! ') ,nl,
  move(Player, X, Y, NewX, NewY),
  retract(p1_positions(Positions)),
  delete(Positions, [X,Y], NewPositions), % remove the old position of the piece
  asserta(p1_positions([[NewX,NewY]|NewPositions])), % add the new position of the piece
  next_player(Player, NextPlayer),
  play(NextPlayer).

% Start the game
:- play(player_1).



