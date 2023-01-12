

:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(between)).
:- use_module(library(random)).
:- use_module(library(aggregate)).
:- use_module(library(ugraphs)).


% Define the size of the board
size(9).
:- dynamic p1_positions/1.
:- dynamic p2_positions/1.
:- dynamic player_positions/2.
:- dynamic position/3.



% test positions for win of player 2
% p1_positions([[1,4], [1,2], [2,4], [3,4], [1,6], [2,6], [3,6], [4,6]]).
% p2_positions([[1,5], [1,3], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

% change the player turn
next_player(player_1, player_2).
next_player(player_2, player_1).

% Define the initial positions of the pieces
p1_positions([[1,4], [2,4], [3,4], [4,4], [1,6], [2,6], [3,6], [4,6]]).
p2_positions([[6,4], [7,4], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

% %X=1;X=9 special move
% lineforward1([[1,4],[4,1],[5,1],[6,1],[9,4],[9,5],[9,6],[6,9],[5,9],[4,9],[1,6],[1,5]]).

% lineBack1([[1,4],[1,5],[1,6],[4,9],[5,9],[6,9],[9,6],[9,5],[9,4],[6,1],[5,1],[4,1]]).

% %X=2;X=8 special move
% lineforward2([[2,4],[4,2],[5,2],[6,2],[8,4],[8,5],[8,6],[6,8],[5,8],[4,8],[2,6],[2,5]]).
% lineBack2([[2,4],[2,5],[2,6],[4,8],[5,8],[6,8],[8,6],[8,5],[8,4],[6,2],[5,2],[4,2]]).

% %X=3;X=7 special move

% lineforward3([[3,4],[4,3],[5,3],[6,3],[7,4],[7,5],[7,6],[6,7],[5,7],[4,7],[3,6],[3,5]]).
% lineBack3([[3,4],[3,5],[3,6],[4,7],[5,7],[6,7],[7,6],[7,5],[7,4],[6,3],[5,3],[4,3]]).


% % list of positions to represent moves around the board in X-axis and y-axis

% %vertical edge moves
% edge_coll_a1([[1,4],[9,4], [8,4], [7,4], [6,4], [5,4], [4,4], [3,4], [2,4]]).
% % inverse of above list

% edge_coll_a11([[9,4],[1,4], [2,4], [3,4], [4,4], [5,4], [6,4], [7,4], [8,4]]).

% edge_coll_a2([[1,5],[9,5], [8,5], [7,5], [6,5], [5,5], [4,5], [3,5], [2,5]]).

% edge_coll_a22([[9,5],[1,5], [2,5], [3,5], [4,5], [5,5], [6,5], [7,5], [8,5]]).

% edge_coll_a3([[1,6],[9,6], [8,6], [7,6], [6,6], [5,6], [4,6], [3,6], [2,6]]).

% edge_coll_a33([[9,6],[1,6], [2,6], [3,6], [4,6], [5,6], [6,6], [7,6], [8,6]]).

% edge_coll_b1([[4,1],[6,1],[5,1]]).
% edge_coll_b11([[6,1],[4,1],[5,1]]).

% edge_coll_b2([[4,2],[6,2],[5,2]]).
% edge_coll_b22([[6,2],[4,2],[5,2]]).
% edge_coll_b3([[4,3],[6,3],[5,3]]).
% edge_coll_b33([[6,3],[4,3],[5,3]]).

% edge_coll_c1([[4,9],[6,9],[5,9]]).
% edge_coll_c11([[6,9],[4,9],[5,9]]).
% edge_coll_c2([[4,8],[6,8],[5,8]]).
% edge_coll_c22([[6,8],[4,8],[5,8]]).

% edge_coll_c3([[4,7],[6,7],[5,7]]).
% edge_coll_c33([[6,7],[4,7],[5,7]]).


% edge_row_d1([[1,6],[1,4],[1,5]]).
% edge_row_d11([[1,4],[1,6],[1,5]]).

% edge_row_d2([[2,6],[2,4],[2,5]]).
% edge_row_d22([[2,4],[2,6],[2,5]]).

% edge_row_d3([[3,6],[3,4],[3,5]]).
% edge_row_d33([[3,4],[3,6],[3,5]]).

% edge_row_e1([[9,6],[9,4],[9,5]]).
% edge_row_e11([[9,4],[9,6],[9,5]]).
% edge_row_e2([[8,6],[8,4],[8,5]]).
% edge_row_e22([[8,4],[8,6],[8,5]]).

% edge_row_e3([[7,6],[7,4],[7,5]]).

% edge_row_e33([[7,4],[7,6],[7,5]]).

% edge_row_f4([[4,1],[4,9],[4,8],[4,7],[4,6],[4,5],[4,4],[4,3],[4,2]]).
% edge_row_f44([[4,9],[4,1],[4,2],[4,3],[4,4],[4,5],[4,6],[4,7],[4,8]]).

% edge_row_f5([[5,1],[5,9],[5,8],[5,7],[5,6],[5,5],[5,4],[5,3],[5,2]]).
% edge_row_f55([[5,9],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6],[5,7],[5,8]]).

% edge_row_f6([[6,1],[6,9],[6,8],[6,7],[6,6],[6,5],[6,4],[6,3],[6,2]]).

% edge_row_f66([[6,9],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7],[6,8]]).



% special_moves(X, Y, NewX, NewY) :-
%     lineforward1(Positions1),
%     lineBack1(Positions2),
%     lineforward2(Positions3),
%     lineBack2(Positions4),
%     lineforward3(Positions5),
%     lineBack3(Positions6),
%     edge_coll_a1(Positions7),
%     edge_coll_a11(Positions8),
%     edge_coll_a2(Positions9),
%     edge_coll_a22(Positions10),
%     edge_coll_a3(Positions11),
%     edge_coll_a33(Positions12),
%     edge_coll_b1(Positions13),
%     edge_coll_b11(Positions14),
%     edge_coll_b2(Positions15),
%     edge_coll_b22(Positions16),
%     edge_coll_b3(Positions17),
%     edge_coll_b33(Positions18),
%     edge_coll_c1(Positions19),
%     edge_coll_c11(Positions20),
%     edge_coll_c2(Positions21),
%     edge_coll_c22(Positions22),
%     edge_coll_c3(Positions23),
%     edge_coll_c33(Positions24),
%     edge_row_d1(Positions25),
%     edge_row_d11(Positions26),
%     edge_row_d2(Positions27),
%     edge_row_d22(Positions28),
%     edge_row_d3(Positions29),
%     edge_row_d33(Positions30),
%     edge_row_e1(Positions31),
%     edge_row_e11(Positions32),
%     edge_row_e2(Positions33),
%     edge_row_e22(Positions34),
%     edge_row_e3(Positions35),
%     edge_row_e33(Positions36),
%     edge_row_f4(Positions37),
%     edge_row_f44(Positions38),
%     edge_row_f5(Positions39),
%     edge_row_f55(Positions40),
%     edge_row_f6(Positions41),
%     edge_row_f66(Positions42),

    
%     (   member([X,Y], Positions1),
%         member([NewX,NewY], Positions1)
%     ;   member([X,Y], Positions2),
%         member([NewX,NewY], Positions2)
        
%     ;   member([X,Y], Positions3),
%         member([NewX,NewY], Positions3)
        
%     ;   member([X,Y], Positions4),
%         member([NewX,NewY], Positions4)
        

    
%     ;   member([X,Y], Positions5),
%         member([NewX,NewY], Positions5)
%     ;   member([X,Y], Positions6),
%         member([NewX,NewY], Positions6) 
        
%     ;   member([X,Y], Positions7),
%         member([NewX,NewY], Positions7)
%     ;   member([X,Y], Positions8),
%         member([NewX,NewY], Positions8)
%     ;   member([X,Y], Positions9),
%         member([NewX,NewY], Positions9)
%     ;   member([X,Y], Positions10),
%         member([NewX,NewY], Positions10)
%         %same from Positions 11 to Positions42
%     ;   member([X,Y], Positions11),
%         member([NewX,NewY], Positions11)
%     ;   member([X,Y], Positions12),
%         member([NewX,NewY], Positions12)

%     ;   member([X,Y], Positions13),

%         member([NewX,NewY], Positions13)
%     ;   member([X,Y], Positions14),
%         member([NewX,NewY], Positions14)
    
%     %repeat for Positions 15 to Positions 42
%     ;   member([X,Y], Positions15),
%         member([NewX,NewY], Positions15)
%     ;   member([X,Y], Positions16),

%         member([NewX,NewY], Positions16)
%     ;   member([X,Y], Positions17),
%         member([NewX,NewY], Positions17)
%     ;   member([X,Y], Positions18),
%         member([NewX,NewY], Positions18)  
%     ;   member([X,Y], Positions19), 

%         member([NewX,NewY], Positions19)

%     ;   member([X,Y], Positions20),
%         member([NewX,NewY], Positions20)
%     ;   member([X,Y], Positions21),
%         member([NewX,NewY], Positions21)
%     ;   member([X,Y], Positions22), 
%         member([NewX,NewY], Positions22)
%     ;   member([X,Y], Positions23),
%         member([NewX,NewY], Positions23)
%     ;   member([X,Y], Positions24),
%         member([NewX,NewY], Positions24)
%     ;   member([X,Y], Positions25),
%         member([NewX,NewY], Positions25)
%     ;   member([X,Y], Positions26),
%         member([NewX,NewY], Positions26)
%     ;   member([X,Y], Positions27),
%         member([NewX,NewY], Positions27)
%     ;   member([X,Y], Positions28),
%         member([NewX,NewY], Positions28)  
%     ;   member([X,Y], Positions29), 
%         member([NewX,NewY], Positions29)
%     ;   member([X,Y], Positions30),
%         member([NewX,NewY], Positions30)
%     ;   member([X,Y], Positions31),
%         member([NewX,NewY], Positions31)
%     ;   member([X,Y], Positions32), 
%         member([NewX,NewY], Positions32)
    
%     ;   member([X,Y], Positions33),
%         member([NewX,NewY], Positions33)
%     ;   member([X,Y], Positions34),
%         member([NewX,NewY], Positions34)
%     ;   member([X,Y], Position35),
%         member([NewX,NewY], Position35)
%     ;   member([X,Y], Positions36),
%         member([NewX,NewY], Positions36)
%     ;   member([X,Y], Positions37),
%         member([NewX,NewY], Positions37)  
%     ;   member([X,Y], Positions38), 
%         member([NewX,NewY], Positions38)
%     ;   member([X,Y], Positions39),
%         member([NewX,NewY], Positions39)
%     ;   member([X,Y], Positions40),
%         member([NewX,NewY], Positions40)
%     ;   member([X,Y], Positions41), 
%         member([NewX,NewY], Positions41)
%     ;   member([X,Y], Positions42),
%         member([NewX,NewY], Positions42)
%     ).
  

% check_path_blocked(List1, Start_Position, End_Position, Result) :-
%     check_positions(List, Start_Position, End_Position,Result),
%     p1_positions(P1_Positions),
%     p2_positions(P2_Positions),
%     member(Marble, Result), 
%     (member(Marble, P1_Positions);
%     member(Marble, P2_Positions)).


% check_positions(List, Start_Position, End_Position,Result) :- 
%    member(Start_Position, List), 
%    member(End_Position, List), 
%    list_between(List, Start_Position, End_Position, Result), 
%    write(Result).

% list_between(List, Start_Position, End_Position, Result) :- 
%    append(_, [Start_Position|T], List), 
%    append(Result, [End_Position|_], T).


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
  board_up_down_lines_rule(NewX,NewY),
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
  board_up_down_lines_rule(NewX,NewY),
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
  board_up_down_lines_rule(NewX,NewY),
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
  board_up_down_lines_rule(NewX,NewY),
  \+ member([NewX, NewY], P1Positions),
  \+ member([NewX, NewY], P2Positions),
  \+ path_blocked(X, Y, NewX, NewY). % check if the path is blocked




% edge_move(X, Y, NewX, NewY):-
% ((X #= NewX), (NewY #= Y));
% (Y #= NewY), (NewX #= NewY).

% move "circular" between row 3, row 7 , column 3 and column 7
% special_move(X, Y, NewX, NewY) :-
%   board_up_down_lines_rule(NewX,NewY), (
%   ((X #= 3 ; X #= 9), (NewY #= 3 ; NewY #= 7));
%   ((Y #= 3 ; Y #= 7), (NewX #= 3 ; NewX #= 7));
%   ((X #= 3 ; X #= 9), (NewX #= 3 ; NewX #= 7));
%   ((Y #= 3 ; Y #= 7), (NewY #= 3 ; NewY #= 7));

%   ((X #= 1 ; X #= 9), (NewY #= 1 ; NewY #= 9));
%   ((Y #= 1 ; Y #= 9), (NewX #= 1 ; NewX #= 9));
%   ((X #= 1 ; X #= 9), (NewX #= 1 ; NewX #= 9));
%   ((Y #= 1 ; Y #= 9), (NewY #= 1 ; NewY #= 9));

  
%   ((X #= 2 ; X #= 8), (NewY #= 2 ; NewY #= 8));
%   ((Y #= 2 ; Y #= 8), (NewX #= 2 ; NewX #= 8));
%   ((X #= 2 ; X #= 8), (NewX #= 2 ; NewX #= 8));
%   ((Y #= 2 ; Y #= 8), (NewY #= 2 ; NewY #= 8))).
  

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
player_positions(cl_easy, Positions) :- p2_positions(Positions).



% player(X, Y, P) represents a piece at position (X, Y) belonging to player P
% P can be either 1 or 2

player(X, Y, player_1) :-
    p1_positions(Positions),
    member([X, Y], Positions).

player(X, Y, player_2) :-
    p2_positions(Positions),
    member([X, Y], Positions).

player(X,Y, cl_easy) :-
    p2_positions(Positions),
    member([X,Y], Positions).

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

next_player_cl_easy(player_1, cl_easy).
next_player_cl_easy(cl_easy, player_1).
%play predicate for the random move player

play2(Player) :-
 
 (Player = player_1,
  write('Player '), write(Player), write(', enter your move (X Y NewX NewY): '),
  read(X), read(Y), read(NewX), read(NewY),nl,
  (move(Player, X, Y, NewX, NewY) -> % if the move is valid
    write('Check inside if with move '), nl,
    player_positions(Player, Positions),
    delete_old_pos([X,Y], Positions, NewPositions), % remove the old position of the piece
    write('Check new positions: '), write(NewPositions), nl,
    write('Check old Positions: '), write(Positions), nl,
    retractall(player_positions(Player, _)),
    write('Check after retract '), nl,
    asserta(player_positions(Player, [[NewX,NewY]|NewPositions])),
    next_player_cl_easy(Player, NextPlayer),
    write(Player), write('turn board final positions: '), nl,
    get_current_board,
    nl, nl,
    play(NextPlayer) % continue with the next player
  ; % otherwise
  write('Invalid move, try again.'), nl,
  play2(Player) % if the move is not valid, ask for a new move from the same player
  )
 ); 
    Player = cl_easy, 
    play_random_move(Player, X, Y,NewX,NewY), 
    retract(player_positions(Player, Positions)),
    delete(Positions, [X, Y], NewPositions),
    append(NewPositions, [[NewX, NewY]], UpdatedPositions),
    asserta(player_positions(Player, UpdatedPositions)),
    % change the current player
    next_player(Player, NextPlayer),
    get_current_board,
    
    play2(NextPlayer).


play2(Player) :-

  has_lost(Player), % check if the current player has lost
  next_player_cl_easy(Player, NextPlayer), % get the next player because the current player has lost
  write('Player: '), write(NextPlayer), write(' wins!'), nl,
  !. % nextPlayer wins, stop the game
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

% Computer player level easy
play_random_move(Player, X, Y, NewX, NewY) :-
    player_positions(Player, Positions),
    member([X, Y], Positions),
    findall([NewX,NewY], valid_move(X, Y, NewX, NewY), NewPositions),
    random_member([NewX, NewY], NewPositions).


random_member(List, Member) :-
    length(List, Length),
    random(1, Length, Index),
    nth1(Index, List, Member).



 


% Start the game
% :-init_board.
% :- play(player_1).



  