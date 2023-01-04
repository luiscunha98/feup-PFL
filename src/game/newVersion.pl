

:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(between)).

% Define the size of the board
size(9).
:- dynamic p1_positions/1.
:- dynamic p2_positions/1.
:- dynamic player_positions/2.


% Define the initial positions of the pieces
p1_positions([[1,4], [2,4], [3,4], [4,4], [1,6], [2,6], [3,6], [4,6]]).
p2_positions([[5,4], [7,4], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

% test positions for win
% p1_positions([[1,1], [2,1], [3,4], [4,4], [1,6], [2,6], [3,6], [4,6]]).
% p2_positions([[1,3], [2,2], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

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
  between(Low, High , BetweenX),
  write('X: '), write(X), nl,
  write('Y: '), write(Y), nl,
  write('NewX: '), write(NewX), nl,
  write('NewY: '), write(NewY), nl,
  write('BetweenX: '), write(BetweenX), nl,
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
  between(Low, High, BetweenX),
  write('X: '), write(X), nl,
  write('Y: '), write(Y), nl,
  write('NewX: '), write(NewX), nl,
  write('NewY: '), write(NewY), nl,
  write('BetweenX: '), write(BetweenX), nl,
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
  between(Low, High, BetweenY),
  write('X: '), write(X), nl,
  write('Y: '), write(Y), nl,
  write('NewX: '), write(NewX), nl,
  write('NewY: '), write(NewY), nl,
  write('BetweenY: '), write(BetweenY), nl,
 ((p1_positions(P1Positions), member([X, BetweenY], P1Positions))
  ;
  (p2_positions(P2Positions), member([X, BetweenY], P2Positions)) ).

% left move
path_blocked(X, Y, NewX, NewY) :-
  integer(X), integer(Y), integer(NewX), integer(NewY),
  write('test left move'), nl,
  X #= NewX,
  Y #> NewY,
  Low is NewY+1,
  High is Y-1,
  Low #=< High, % between needs to have low <= high
  between(Low, High, BetweenY),
  write('X: '), write(X), nl,
  write('Y: '), write(Y), nl,
  write('NewX: '), write(NewX), nl,
  write('NewY: '), write(NewY), nl,
  write('BetweenY: '), write(BetweenY), nl,
  ((p1_positions(P1Positions), member([X, BetweenY], P1Positions))
  ;
  (p2_positions(P2Positions), member([X, BetweenY], P2Positions)) ).

  




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




% % circular special wana moves

% % move circular from row 1
% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from row 1
%   ( X #= 1, Y #=> 4, Y #=< 6 ), % from row 1
%   ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY#= 9 ; NewY #= 1)); % left and right
%   (NewX #=9,( NewY #=4; NewY #=5, NewY #=6)) ; % down
%   (NewX #= 1, NewY #=< 6, NewY #=> 4), % right
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % move circular from row 9
% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from row 9
%   ( X #= 9, Y #=> 4, Y #=< 6 ), % from row 9
%   ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 9 ; NewY #= 1)); % left and right
%   (NewX #=9,( NewY #=4; NewY #=5, NewY #=6)) ; % down
%   (NewX #= 1, NewY #=< 6, NewY #=> 4), % up
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % move circular from row 2

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from row 2
%   ( X #= 2, Y #=> 4, Y #=< 6 ), % from row 2
%   ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 8 ; NewY #= 2)); % left and right
%   (NewX #=8,( NewY #=4; NewY #=5, NewY #=6)) ; % down
%   (NewX #= 2, NewY #=< 6, NewY #=> 4), % up
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % move circular from row 8

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from row 8
%   ( X #= 8, Y #=> 4, Y #=< 6 ), % from row 8
%   ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 8 ; NewY #= 2)); % left and right
%   (NewX #=8,( NewY #=4; NewY #=5, NewY #=6)) ; % down
%   (NewX #= 2, NewY #=< 6, NewY #=> 4), % up
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % move circular from row 7

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from row 7
%   ( X #= 7, Y #=> 4, Y #=< 6 ), % from row 7
%   ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 7 ; NewY #= 3)); % left and right
%   (NewX #=7,( NewY #=4; NewY #=5, NewY #=6)) ; % down
%   (NewX #= 3, NewY #=< 6, NewY #=> 4), % up
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % move circular from row 3

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from row 3
%   ( X #= 3, Y #=> 4, Y #=< 6 ), % from row 3
%   ((NewX #= 4; NewX #= 5; NewX #= 6), (NewY #= 7 ; NewY #= 3)); % left and right
%   (NewX #=7,( NewY #=4; NewY #=5, NewY #=6)) ; % down
%   (NewX #= 3, NewY #=< 6, NewY #=> 4), % up
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % the same as above for rows 1,2,3, 7,8,9 but now for columns 1,2,3, 7,8,9

% % move circular from column 1

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from column 1
%   ( Y #= 1, X #=> 4, X #=< 6 ), % from column 1
%   ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 9 ; NewX #= 1)); % up and down
%   (NewY #=9,( NewX #=4; NewX #=5, NewX #=6)) ; % right
%   (NewY #= 1, NewX #=< 6, NewX #=> 4), % left
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % move circular from column 9

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from column 9
%   ( Y #= 9, X #=> 4, X #=< 6 ), % from column 9
%   ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 9 ; NewX #= 1)); % up and down
%   (NewY #=9,( NewX #=4; NewX #=5, NewX #=6)) ; % right
%   (NewY #= 1, NewX #=< 6, NewX #=> 4), % left
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % move circular from column 7

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from column 7
%   ( Y #= 7, X #=> 4, X #=< 6 ), % from column 7
%   ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 7 ; NewX #= 3)); % up and down
%   (NewY #=7,( NewX #=4; NewX #=5, NewX #=6)) ; % right
%   (NewY #= 3, NewX #=< 6, NewX #=> 4), % left
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked



% % move circular from column 3

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from column 3
%   ( Y #= 3, X #=> 4, X #=< 6 ), % from column 3
%   ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 7 ; NewX #= 3)); % up and down
%   (NewY #=7,( NewX #=4; NewX #=5, NewX #=6)) ; % right
%   (NewY #= 3, NewX #=< 6, NewX #=> 4), % left
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % move circular from column 2

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from column 2
%   ( Y #= 2, X #=> 4, X #=< 6 ), % from column 2
%   ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 8 ; NewX #= 2)); % up and down
%   (NewY #=8,( NewX #=4; NewX #=5, NewX #=6)) ; % right
%   (NewY #= 2, NewX #=< 6, NewX #=> 4), % left
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked


% % move circular from column 8

% valid_move(X, Y, NewX, NewY) :-
%   size(S),
%   X#=> 1, X#=< S , X > 0,
%   NewX #=> 1, NewX #=< S,  
%   % circular movement from column 8
%   ( Y #= 8, X #=> 4, X #=< 6 ), % from column 8
%   ((NewY #= 4; NewY #= 5; NewY #= 6), (NewX #= 8 ; NewX #= 2)); % up and down
%   (NewY #=8,( NewX #=4; NewX #=5, NewX #=6)) ; % right
%   (NewY #= 2, NewX #=< 6, NewX #=> 4), % left
%   p1_positions(P1Positions),
%   p2_positions(P2Positions),
%   \+ member([NewX, NewY], P1Positions),
%   \+ member([NewX, NewY], P2Positions),
%    \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked



% movements around edges


% Define the rules for moving a piece
move(player_1, X, Y, NewX, NewY) :-
  NewX #>= 1,
  NewX #=< 9,
  NewY #>= 1,
  NewY #=< 9,
  p1_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY),
   write('Check inside move predicate '), nl,
  p2_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions). % the new position must be empty
move(player_2, X, Y, NewX, NewY) :-
  NewX #>= 1,
  NewX #=< 9,
  NewY #>= 1,
  NewY #=< 9,
  p2_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY),
  
  p1_positions(OpponentPositions),
  \+ member([NewX,NewY], OpponentPositions). % the new position must be empty

% Get the positions of a player
player_positions(player_1, Positions) :- p1_positions(Positions).
player_positions(player_2, Positions) :- p2_positions(Positions).


num_pieces_trapped(Player, NumTrapped) :-
  Player = player_1,
  p1_positions(Positions), % get the positions of player 1's pieces
  findall([X, Y], (member([X, Y], Positions), \+ move(Player, X, Y, _, _)), TrappedPositions),
  length(TrappedPositions, NumTrapped).

num_pieces_trapped(Player, NumTrapped) :-
  Player = player_2,
  p1_positions(Positions), % get the positions of player 1's pieces
  findall([X, Y], (member([X, Y], Positions), \+ move(Player, X, Y, _, _)), TrappedPositions),
  length(TrappedPositions, NumTrapped).

trapped(Player) :-
  Player = player_1,
  p1_positions(Positions), % get the positions of player 1's pieces
  findall([X, Y], (member([X, Y], Positions), \+ move(Player, X, Y, _, _)), TrappedPositions),
  TrappedPositions \= []. % check if there are any trapped pieces


trapped(Player) :-
  Player = player_2,
  p2_positions(Positions), % get the positions of player 1's pieces
  findall([X, Y], (member([X, Y], Positions), \+ move(Player, X, Y, _, _)), TrappedPositions),
  TrappedPositions \= []. % check if there are any trapped pieces


% Define the rule for determining if a player has won
lose(Player) :-
  trapped(Player). % player wins if they are not trapped and their opponent is

% Define the rule for deleting an element ( list with pair position) from a list
delete_old_pos(Elem, [Elem|Tail], Tail).
delete_old_pos(Elem, [Head|Tail], [Head|NewTail]) :- delete_old_pos(Elem, Tail, NewTail).

play(Player) :-
  lose(Player),
  next_player(Player, NextPlayer),
  write('Player '), write(NextPlayer), write(' wins!'), nl,
  !. % player wins, stop the game
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

    play(NextPlayer) % continue with the next player
  ; % otherwise
  write('Invalid move, try again.'), nl,
  play(Player) % if the move is not valid, ask for a new move from the same player
  ).

display_board(Board) :-
  write(' 1 2 3 4 5 6 7 8 9'), nl,
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



