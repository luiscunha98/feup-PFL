

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
  board_up_down_lines_rule(NewX,NewY), % NewX, NewY not a impossible move
  between(Low, High, BetweenY),
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



% movements around edges

% Define the rules for moving a piece
move(player_1, X, Y, NewX, NewY) :-
  NewX #>= 1,
  NewX #=< 9,
  NewY #>= 1,
  NewY #=< 9,
  p1_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY).
move(player_2, X, Y, NewX, NewY) :-
  NewX #>= 1,
  NewX #=< 9,
  NewY #>= 1,
  NewY #=< 9,
  p2_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY).

move(cl_easy_1, X, Y, NewX, NewY) :-
  NewX #>= 1,
  NewX #=< 9,
  NewY #>= 1,
  NewY #=< 9,
  p2_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY).


move(cl_easy_2, X, Y, NewX, NewY) :-
  NewX #>= 1,
  NewX #=< 9,
  NewY #>= 1,
  NewY #=< 9,
  p1_positions(Positions),
  member([X,Y], Positions), % find the position of the piece
  valid_move(X, Y, NewX, NewY).

% Get the positions of a player
player_positions(player_1, Positions) :- p1_positions(Positions).
player_positions(player_2, Positions) :- p2_positions(Positions).
player_positions(cl_easy_1, Positions) :- p2_positions(Positions).
player_positions(cl_easy_2, Positions) :- p1_positions(Positions).


% player(X, Y, P) represents a piece at position (X, Y) belonging to player P
% P can be either 1 or 2

player(X, Y, player_1) :-
    p1_positions(Positions),
    member([X, Y], Positions).

player(X, Y, player_2) :-
    p2_positions(Positions),
    member([X, Y], Positions).

player(X,Y, cl_easy_1) :-
    p2_positions(Positions),
    member([X,Y], Positions).

player(X,Y, cl_easy_2) :-
    p1_positions(Positions),
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

next_player_cl_easy_pl(player_1, cl_easy_1).
next_player_cl_easy_pl(cl_easy_1, player_1).

next_player_cl_easy_cl(cl_easy_1,cl_easy_2).
next_player_cl_easy_cl(cl_easy_2,cl_easy_1).

%play predicate for the random move player
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
    write('  1 2 3 4 5 6 7 8 9'), nl, % write the column numbers
    forall(between(1, 9, X),
        (write(X), write(' '), % write the row number
        forall(between(1, 9, Y),
            (position(X, Y, P),
             write(P),
             write(' '))),
        nl)).
% Get the current board
get_current_board(Player,NextPlayer):-
    init_board,
    
    player_positions(Player, PlPositions),
    player_positions(NextPlayer, NPPositions),
    write('Player positions: '), write(PlPositions), nl,
    write('Next player positions: '), write(NPPositions), nl,

    ((Player = player_1 ) ->
        set_p1_positions(PlPositions),
        set_p2_positions(NPPositions),
        display_board
        ;
        set_p1_positions(NPPositions),
        set_p2_positions(PlPositions),
        display_board
    ).
    

% Computer player level easy
play_random_move(Player, X, Y, NewX, NewY) :-
   get_all_possible_moves(Player, Moves),
   random_member(Moves, [X, Y, NewX, NewY]),
   write('Computer player '), write(Player),write(' played move [X,Y to NewX, NewY]: '), write([X, Y, NewX, NewY]),nl,nl.
find_valid_move([[X, Y]|Rest], X, Y, NewX, NewY) :-
    findall([X1,Y1], valid_move(X, Y, X1, Y1), NewPositions),
    ( NewPositions \= [] ->
        random_member([X1, Y1], NewPositions),
        NewX = X1,
        NewY = Y1
    ;
    find_valid_move(Rest, X, Y, NewX, NewY)
    ).
find_valid_move([], -1, -1, -1, -1).

get_all_possible_moves(Player, Moves) :-
    player_positions(Player, Positions),
    size(S),
    findall([X, Y, NewX, NewY], (member([X, Y], Positions), between(1, S, NewX), between(1, S, NewY), move(Player,X, Y, NewX, NewY)), Moves).



random_member(List, Member) :-
    length(List, Length),
    random(1, Length, Index),
    nth1(Index, List, Member).

:- init_board.

delete_old_update([X,Y], Positions, NewPositions) :-
    delete_old([X,Y], Positions, NewPositions),
    retract(player_positions(Player, Positions)),
    assertz(player_positions(Player, NewPositions)).


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

%define position predicate

% Start the game
% :- play2(cl_easy).