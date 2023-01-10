

:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(between)).
:- use_module(library(random)).
:- use_module(library(aggregate)).

% Define the size of the board
size(9).
:- dynamic p1_positions/1.
:- dynamic p2_positions/1.
:- dynamic player_positions/2.
:- dynamic position/3.


% Define the initial positions of the pieces
p1_positions([[1,4], [2,4], [3,4], [4,4], [1,6], [2,6], [3,6], [4,6]]).
p2_positions([[6,4], [7,4], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

% test positions for win of player 2
% p1_positions([[1,4], [1,2], [2,4], [3,4], [1,6], [2,6], [3,6], [4,6]]).
% p2_positions([[1,5], [1,3], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

% change the player turn
next_player(player_1, player_2).
next_player(player_2, player_1).

% verificar path blocked conditions pois está a incluir 1,2 como estando no caminho de um movimento de 1,1 para 1,2 ou 1,3
% this conditions like:  Low is X+1, % 
%   High is NewX-1, is not working
% Define the rule for checking if the path is blocked
% down move
path_blocked(X, Y, NewX, NewY) :-
  integer(X), integer(Y), integer(NewX), integer(NewY),

  X #< NewX,
  Y #= NewY,
  Low is X+1, % 
  High is NewX-1,
  Low #=< High, % between needs to have low <= high
  board_up_down_lines_rule(NewX,NewY), % NewX, NewY not a impossible move
  between(Low, High , BetweenX),
  % write('X: '), write(X), nl,
  % write('Y: '), write(Y), nl,
  % write('NewX: '), write(NewX), nl,
  % write('NewY: '), write(NewY), nl,
  % write('BetweenX: '), write(BetweenX), nl,
  ((p1_positions(P1Positions), member([BetweenX, Y], P1Positions))
  ;
  (p2_positions(P2Positions), member([BetweenX, Y], P2Positions)) ).

% up move
path_blocked(X, Y, NewX, NewY) :-
  integer(X), integer(Y), integer(NewX), integer(NewY),
  X #> NewX,
  Y #= NewY,
  Low is NewX+1,
  High is X-1,
  Low #=< High, % between needs to have low <= high
  board_up_down_lines_rule(NewX,NewY), % NewX, NewY not a impossible move
  between(Low, High, BetweenX),
  % write('X: '), write(X), nl,
  % write('Y: '), write(Y), nl,
  % write('NewX: '), write(NewX), nl,
  % write('NewY: '), write(NewY), nl,
  % write('BetweenX: '), write(BetweenX), nl,
  ((p1_positions(P1Positions), member([BetweenX, Y], P1Positions))
  ;
  (p2_positions(P2Positions), member([BetweenX, Y], P2Positions)) ).

% right move
path_blocked(X, Y, NewX, NewY) :-
  integer(X), integer(Y), integer(NewX), integer(NewY),
  X #= NewX,
  Y #< NewY,
  Low is Y+1,
  High is NewY-1,
  Low #=< High, % between needs to have low <= high
  board_up_down_lines_rule(NewX,NewY), % NewX, NewY not a impossible move
  between(Low, High, BetweenY),
  % write('X: '), write(X), nl,
  % write('Y: '), write(Y), nl,
  % write('NewX: '), write(NewX), nl,
  % write('NewY: '), write(NewY), nl,
  % write('BetweenY: '), write(BetweenY), nl,
 ((p1_positions(P1Positions), member([X, BetweenY], P1Positions))
  ;
  (p2_positions(P2Positions), member([X, BetweenY], P2Positions)) ).

% left move
path_blocked(X, Y, NewX, NewY) :-
  integer(X), integer(Y), integer(NewX), integer(NewY),
  X #= NewX,
  Y #> NewY,
  Low is NewY+1,
  High is Y-1,
  Low #=< High, % between needs to have low <= high
  ((p1_positions(P1Positions), member([X, BetweenY], P1Positions))
  ;
  (p2_positions(P2Positions), member([X, BetweenY], P2Positions)) ).

% True if the position is not a position that should be blocked to any player
board_up_down_lines_rule(NewX,NewY) :-
   % Check if the new position is one of the positions that should be blocked to any player
  ( member(NewX, [1, 2, 3]), member(NewY, [1, 2, 3, 7, 8, 9])
    ;  member(NewX, [7, 8, 9]), member(NewY, [1, 2, 3, 7, 8, 9]) ) -> fail ; true.


% Define the list of valid moves for a piece
% Move vertical down
valid_move(X, Y, NewX, NewY) :-
  integer(X), integer(Y), integer(NewX), integer(NewY),
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
  integer(X), integer(Y), integer(NewX), integer(NewY),
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
  integer(X), integer(Y), integer(NewX), integer(NewY),
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
  integer(X), integer(Y), integer(NewX), integer(NewY),
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




% edge_move(X, Y, NewX, NewY):-
% ((X #= NewX), (NewY #= Y));
% (Y #= NewY), (NewX #= NewY).

% move "circular" between row 3, row 7 , column 3 and column 7
special_move(X, Y, NewX, NewY) :-
  board_up_down_lines_rule(NewX,NewY), (
  ((X #= 3 ; X #= 9), (NewY #= 3 ; NewY #= 7));
  ((Y #= 3 ; Y #= 7), (NewX #= 3 ; NewX #= 7));
  ((X #= 3 ; X #= 9), (NewX #= 3 ; NewX #= 7));
  ((Y #= 3 ; Y #= 7), (NewY #= 3 ; NewY #= 7));

  ((X #= 1 ; X #= 9), (NewY #= 1 ; NewY #= 9));
  ((Y #= 1 ; Y #= 9), (NewX #= 1 ; NewX #= 9));
  ((X #= 1 ; X #= 9), (NewX #= 1 ; NewX #= 9));
  ((Y #= 1 ; Y #= 9), (NewY #= 1 ; NewY #= 9));

  
  ((X #= 2 ; X #= 8), (NewY #= 2 ; NewY #= 8));
  ((Y #= 2 ; Y #= 8), (NewX #= 2 ; NewX #= 8));
  ((X #= 2 ; X #= 8), (NewX #= 2 ; NewX #= 8));
  ((Y #= 2 ; Y #= 8), (NewY #= 2 ; NewY #= 8)));
  edge_move(X, Y, NewX, NewY).

% check if the path is blocked for the special moves
% check if the path is blocked for the special moves
spec_path_blocked(X, Y, NewX, NewY) :-
    X #= NewX,
    Y #< NewY,
    Y1 #= Y + 1,
    Y1 #< NewY,
    p1_positions(P1Positions),
    p2_positions(P2Positions),
    \+ member([X, Y1], P1Positions),
    \+ member([X, Y1], P2Positions),
    spec_path_blocked(X, Y1, NewX, NewY).

spec_path_blocked(X, Y, NewX, NewY) :-
    X #= NewX,
    Y #> NewY,
    Y1 #= Y - 1,
    Y1 #> NewY,
    p1_positions(P1Positions),
    p2_positions(P2Positions),
    \+ member([X, Y1], P1Positions),
    \+ member([X, Y1], P2Positions),
    spec_path_blocked(X, Y1, NewX, NewY).

spec_path_blocked(X, Y, NewX, NewY) :-
    X #< NewX,
    Y #= NewY,
    X1 #= X + 1,
    X1 #< NewX,
    p1_positions(P1Positions),
    p2_positions(P2Positions),
    \+ member([X1, Y], P1Positions),
    \+ member([X1, Y], P2Positions),
    spec_path_blocked(X1, Y, NewX, NewY).

spec_path_blocked(X, Y, NewX, NewY) :-
    X #> NewX,
    Y #= NewY,
    X1 #= X - 1,
    X1 #> NewX,
    p1_positions(P1Positions),
    p2_positions(P2Positions),
    \+ member([X1, Y], P1Positions),
    \+ member([X1, Y], P2Positions),
    spec_path_blocked(X1, Y, NewX, NewY).


% movements around edges


% Define the rules for moving a piece
move(player_1, X, Y, NewX, NewY) :-
  NewX #>= 1,
  NewX #=< 9,
  NewY #>= 1,
  NewY #=< 9,
  board_up_down_lines_rule(NewX,NewY),
  (
  valid_move(X, Y, NewX, NewY)->
  p1_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  p2_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions); % the new position must be empty
  special_move(X, Y, NewX, NewY),
  spec_path_blocked(X, Y, NewX, NewY),
  p1_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  p2_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions) ). % the new position must be empty
 
move(player_2, X, Y, NewX, NewY) :-
  NewX #>= 1,
  NewX #=< 9,
  NewY #>= 1,
  NewY #=< 9,
  board_up_down_lines_rule(NewX,NewY),
  (
  valid_move(X, Y, NewX, NewY)->
  p2_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  p1_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions);
  special_move(X, Y, NewX, NewY),
  spec_path_blocked(X, Y, NewX, NewY),
  p2_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  p1_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions)
  ). % the new position must be empty

check_move_val(Player, X, Y, NewX, NewY) :-
  
  NewX #>= 1,
  NewX #=< 9,
  NewY #>= 1,
  NewY #=< 9,
  board_up_down_lines_rule(NewX,NewY),

% Get the positions of a player
player_positions(player_1, Positions) :- p1_positions(Positions).
player_positions(player_2, Positions) :- p2_positions(Positions).


% player(X, Y, P) represents a piece at position (X, Y) belonging to player P
% P can be either 1 or 2

player(X, Y, player_1) :-
    p1_positions(Positions),
    member([X, Y], Positions).

player(X, Y, player_2) :-
    p2_positions(Positions),
    member([X, Y], Positions).

% Check if the given piece cannot move
cant_move(X, Y, P) :-
    player(X, Y, P), % check that the piece belongs to player P
    \+ (
        % loop through all positions on the board
        between(1, 9, X2), between(1, 9, Y2),
        % check if the current position is reachable from the starting position/piece position
        move(P,X, Y, X2, Y2)
    ).

% Check if any of player P's pieces cannot move
player_cant_move(P) :-
    player(_, _, P), % find a piece belonging to player P
    cant_move(_, _, P). % check if that piece cannot move

% Check if the current player has lost by checking if any of their opponent's pieces cannot move
has_lost(P) :-
    player_cant_move(P). % check if any of the player pieces cannot move

% Define the rule for deleting an element ( list with pair position) from a list
delete_old_pos(Elem, [Elem|Tail], Tail).
delete_old_pos(Elem, [Head|Tail], [Head|NewTail]) :- delete_old_pos(Elem, Tail, NewTail).

play(Player) :-

  has_lost(Player), % check if the current player has lost
  next_player(Player, NextPlayer), % get the next player because the current player has lost
  write('Player: '), write(NextPlayer), write(' wins!'), nl,
  !. % nextPlayer wins, stop the game
%Define the main game loop
play(Player) :-
 
 
  write('Player '), write(Player), write(', enter your move (X Y NewX NewY): '),
  read(X), read(Y), read(NewX), read(NewY),nl,
  write('Check outside if with move '), nl,
  (move(Player, X, Y, NewX, NewY) -> % if the move is valid
    write('Check inside if with move '), nl,
    player_positions(Player, Positions),
    delete_old_pos([X,Y], Positions, NewPositions), % remove the old position of the piece
    write('Check new positions: '), write(NewPositions), nl,
    write('Check old Positions: '), write(Positions), nl,
    retractall(player_positions(Player, _)),
    write('Check after retract '), nl,
    asserta(player_positions(Player, [[NewX,NewY]|NewPositions])),
    next_player(Player, NextPlayer),
    write(Player), write('turn board final positions: '), nl,
    get_current_board,
    nl, nl,
    play(NextPlayer) % continue with the next player
  ; % otherwise
  write('Invalid move, try again.'), nl,
  play(Player) % if the move is not valid, ask for a new move from the same player
  ).

%play predicate for the random move player




% To iterate through list and perform a goal on each element
% forall(Xs, Goal) :-
%     maplist(Goal, Xs).



% Initialize the board
% Initialize the board


% Set the positions of player 1 on the board
% Define the set_p1_positions/1 predicate
set_p1_positions([]).
set_p1_positions([[X, Y]|Tail]) :-
    retract(position(X, Y, _)),
    assertz(position(X, Y, 'g')),
    set_p1_positions(Tail).

% Define the set_p2_positions/1 predicate
set_p2_positions([]).
set_p2_positions([[X, Y]|Tail]) :-
    retract(position(X, Y, _)),
    assertz(position(X, Y, 'w')),
    set_p2_positions(Tail).

init_board :-
    retractall(position(_, _, _)),
    forall(between(1, 9, X),
           (forall(between(1, 9, Y),
                   (   ((X = 1 ; X = 2 ; X = 3), (Y = 1 ; Y = 2 ; Y = 3 ; Y = 7 ; Y = 8 ; Y = 9) )
                   ->  assertz(position(X, Y, ' '))
                   ;  ( (X = 7 ; X = 8 ; X = 9), (Y = 1 ; Y = 2 ; Y = 3 ; Y = 7 ; Y = 8 ; Y = 9) )
                   ->  assertz(position(X, Y, ' '))
                   ;
                   assertz(position(X, Y, '.'))
                   )))).
% Display the board
% Display the board
display_board :-
    forall(between(1, 9, X),
           (forall(between(1, 9, Y),
                   (position(X, Y, P),
                    write(P),
                    write(' '))),
            nl)).
% Get the current board
get_current_board :-
  init_board,
  p1_positions(P1Positions),
  p2_positions(P2Positions),
  set_p1_positions(P1Positions),
  set_p2_positions(P2Positions),
  display_board.


% Select a random element from a list
select_random_element(List, Element) :-
  length(List, Length),
  random(0, Length, Index),
  nth0(Index, List, Element).

% Simulated player that plays a random possible move
play_random_move(Player, NewX, NewY) :-
  % Retrieve the current player positions
  player_positions(Player, Positions),
  % Find all possible moves for the current player
  findall([X, Y, NewX, NewY], (member([X, Y], Positions), move(X, Y, NewX, NewY)), PossibleMoves),
  % Select a random element from the list of possible moves
  select_random_element(PossibleMoves, [_, _, NewX, NewY]),
  delete_old_pos([X,Y], Positions, NewPositions),
  retractall(player_positions(Player, _)),
  % Remove the old position of the piece
  % Add the new position of the piece
  asserta(player_positions(Player, [[NewX,NewY]|NewPositions])).


 


% Start the game
% :-init_board.
% :- play(player_1).



  