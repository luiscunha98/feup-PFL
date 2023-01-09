% Consults
:- consult('newVersion.pl').

%Define the initial positions of the pieces
% p1_positions([[1,4], [2,4], [3,4], [4,4], [1,6], [2,6], [3,6], [4,6]]).
% p2_positions([[6,4], [7,4], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

p1_positions([[1,4], [2,5], [3,5], [3,4], [4,5], [2,6], [3,6], [4,6]]).
p2_positions([[1,5], [2,4], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

test_move :-
    write('Testing move/5: '), nl,
    move(player_1, 1, 4, 1, 5), % valid move
    move(player_1, 1, 6, 1, 5), % valid move
    move(player_1, 4, 4, 4, 1), % valid move
    move(player_1, 4, 4, 4, 9), % valid move
    \+move(player_1, 4, 6, 8, 6), % invalid move
    \+move(player_1, 1, 1, 1, 2), % invalid move, not possible
    \+move(player_1, 1, 4, 9,4), % invalid move, no empty space  and path blocked
    \+move(player_1, 1, 4, 0, 4), % invalid move, piece cannot move off the board
    \+move(player_1, 1, 4, 1, 5), % invalid move, piece cannot move to a opponent piece space
    \+move(player_1, 1, 4,2, 4),nl. % invalid move, piece cannot move to a opponent piece space


test_board_up_down_lines_rule:-
    write('Testing test_board_up_down_lines_rule/4: '), nl,
    \+board_up_down_lines_rule( 1, 2), % not possible position to move
    board_up_down_lines_rule(1, 5). % possible position to move 

test_path_blocked :-
    write('Testing path_blocked/5: '), nl,
    \+path_blocked(1, 4, 1, 5), % not blocked
    \+path_blocked(1, 1, 1, 1), % not possible and same position
    path_blocked(1, 4, 6, 4), % blocked, piece cannot move to a opponent piece space and path is blocked
    path_blocked(1, 4,3, 4),nl. % , piece cannot move to a same player different piece space and with a piece in the middle


test_piece_cant_move :-
    write('Testing piece_cant_move/2: '), nl,
    cant_move(1,4,player_1), % piece cant move on player 1 turn
   \+cant_move(8,5,player_2), % piece can move on player 2 turn
    write('Test sucessful'), nl.

test_player_trapped_lost:-
    
    write('Testing has_won/1: '), nl,
    
    has_lost(player_1), % player 1 has lost
    \+has_lost(player_2). % player 2 has won
    
test_init_board :-
    write('Testing init_board/0: '), nl,
    init_board.

test_display_board :-
    write('Testing get_current_board/0: '), nl,
    get_current_board.


