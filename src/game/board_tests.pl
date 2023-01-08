% Consults
:- consult('newVersion.pl').

% Define the initial positions of the pieces
% p1_positions([[1,4], [2,4], [3,4], [4,4], [1,6], [2,6], [3,6], [4,6]]).
% p2_positions([[5,4], [7,4], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

p1_positions([[1,4], [1,2], [2,4], [3,4], [1,6], [2,6], [3,6], [4,6]]).
p2_positions([[1,5], [1,3], [8,4], [9,4], [6,6], [7,6], [8,6], [9,6]]).

test_move :-
    write('Testing move/5: '), nl,
    move(player_1, 1, 4, 1, 5), % valid move
    move(player_1, 1, 6, 1, 5), % valid move
    move(player_1, 4, 4, 4, 1), % valid move
    move(player_1, 4, 4, 4, 9), % valid move
    \+move(player_1, 4, 6, 8, 6), % invalid move
    \+move(player_1, 1, 4, 7, 4), % invalid move, no empty space 
    \+move(player_1, 1, 4, 0, 4), % invalid move, piece cannot move off the board
    \+move(player_1, 1, 1, 1, 1), % invalid move, piece cannot move to the same space
    \+move(player_1, 1, 4, 5, 4), % invalid move, piece cannot move to a opponent piece space
    \+move(player_1, 1, 4,2, 4),nl. % invalid move, piece cannot move to a same player different piece space


test_path_blocked :-

    write('Testing path_blocked/5: '), nl,
    \+path_blocked(1, 4, 1, 5), % not blocked
    path_blocked(4, 4, 6, 4), % blocked move, path blocked by opponent piece ( 5,4)
    \+path_blocked(1, 1, 1, 1), % not path, piece cannot move to the same space
    path_blocked(1, 4, 6, 4), % blocked, piece cannot move to a opponent piece space
    path_blocked(1, 4,3, 4),nl. % , piece cannot move to a same player different piece space and with a piece in the middle


test_piece_cant_move :-
    write('Testing piece_cant_move/2: '), nl,
    cant_move(1,4,player_1), % piece cant move on player 1 turn
   \+cant_move(1,5,player_2), % piece can move on player 2 turn
    write('Test sucessful'), nl.

test_player_trapped:-
   
    write('Testing has_won/1: '), nl,
    has_lost(player_1), % player 1 has lost
    \+has_lost(player_2). % player 2 has won
    
test_print_board :-
    write('Testing print_board/0: '), nl,
    print_board.