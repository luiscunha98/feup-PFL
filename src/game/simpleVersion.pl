consult('game/display.pl').
:- use_module(library(lists)).
% Define the board as a list of lists, with each inner list representing a row on the board
% e is for empty position 
board([[e,e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e,e]]).

% Define the initial position of the marbles
initial_position(p2, 0, 3).
initial_position(p2, 1, 3).
initial_position(p2, 2, 3).
initial_position(p2, 3, 3).
initial_position(p2, 0, 5).
initial_position(p2, 1, 5).
initial_position(p2, 2, 5).
initial_position(p2, 3, 5).

initial_position(p1, 5, 3).
initial_position(p1, 6, 3).
initial_position(p1, 7, 3).
initial_position(p1, 8, 3).
initial_position(p1, 5, 5).
initial_position(p1, 6, 5).
initial_position(p1, 7, 5).
initial_position(p1, 8, 5).



% Define the legal moves for a marble
move(X, Y, X2, Y2) :- X = X2, Y2 is (Y+1) mod 9.
move(X, Y, X2, Y2) :- X = X2, Y2 is (Y-1) mod 9.
move(X, Y, X2, Y2) :- Y = Y2, X2 is (X+1) mod 9.
move(X, Y, X2, Y2) :- Y = Y2, X2 is (X-1) mod 9.

% Check if a move is legal
legal_move(X, Y, X2, Y2) :- move(X, Y, X2, Y2).

% Check if a position is occupied by a marble
occupied(X, Y) :- initial_position(_, X, Y).

% Check if a move is valid (i.e., the destination is not occupied and the move is legal)
valid_move(X, Y, X2, Y2) :-
    legal_move(X, Y, X2, Y2), % Check if the move is legal
    (X = X2 -> % If the marble is moving horizontally
     (Y2 > Y -> % If the marble is moving to the right
      (findall(Y3, occupied(X, Y3), L), % Find all occupied positions  in the same row as the marble
       \+member(Y2, L)) % Check if the destination positions is not occupied
      ; % If the marble is moving to the left
      (findall(Y3, occupied(X, Y3), L), % Find all occupied positions  in the same row as the marble
       \+member(Y2, L))) % Check if the destination positions is not occupied
     ; % If the marble is moving vertically
     (X2 > X -> % If the marble is moving down
      (findall(X3, occupied(X3, Y), L), % Find all occupied positions  in the same column as the marble
       \+member(X2, L)) % Check if the destination positions is not occupied
      ; % If the marble is moving up
      (findall(X3, occupied(X3, Y), L), % Find all occupied positions  in the same column as the marble
       \+member(X2, L)))). % Check if the destination positions is not occupied


% Play a turn by making a move
play_turn(Color, X, Y, X2, Y2) :-
    initial_position(Color, X, Y), % Select a piece of the correct color
    write('Enter destination square (X Y): '), % Prompt the player for the destination square
    read(X2), read(Y2), % Read the destination square from the user
    valid_move(X, Y, X2, Y2), % Check if the move is valid
    retract(initial_position(Color, X, Y)), % Remove the piece from its original position
    assert(initial_position(Color, X2, Y2)). % Place the piece in the new position

% Check if a player has won the game
win(Player) :- initial_position(Player, 0, 4).
win(Player) :- initial_position(Player, 4, 4).



% Display the current state of the board
display_board :-
    board(B), % Retrieve the current board
    print_board(B). % Print the board

% Print the board
print_board([H|T]) :-
    print_row(H), % Print the current row
    nl, % Move to the next line
    print_board(T). % Print the rest of the board
print_board([]). % Base case

% Print a row of the board
print_row([H|T]) :-
    print_cell(H), % Print the current cell
    print_row(T). % Print the rest of the row
print_row([]). % Base case

% Print a cell of the board
print_cell(e) :- write('.'). % If the cell is empty, print a dot
print_cell(p1) :- write('X'). % If the cell is occupied by player 1, print an 'X'
print_cell(p2) :- write('O'). % If the cell is occupied by player 2, print an 'O'


% Play a game of wana
play :-
    write('P1''s turn'), nl,
    play_turn(p1, X, Y, X2, Y2), % p1 plays
    write('P1 moved from '), write((X,Y)), write(' to '), write((X2,Y2)), nl,
    (win(p1) -> write('P1 wins!'); % If p1 has won, end the game
     (write('P2''s turn'), nl,
      play_turn(p2, X3, Y3, X4, Y4), % p2 plays
      write('P2 moved from '), write((X3,Y3)), write(' to '), write((X4,Y4)), nl,
      (win(p2) -> write('P2 wins!'); % If p2 has won, end the game
       (write('It''s a draw!'))) % Otherwise, the game is a draw
     )).

