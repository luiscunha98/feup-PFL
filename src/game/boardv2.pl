

% The board is represented as a list of lists, with each inner list representing a row on the board
% Each element in the inner list is either a 'x' if the space is occupied by a marble, or a '-' if it is empty
board([
                ['p1', '-', 'p1'],
                ['p1', '-', 'p1'],
                ['p1', '-', 'p1'],
    [ '-', '-','-', 'p1', '-','p1', '-', '-','-'],
    [ '-', '-','-', '-', '-','-', '-', '-','-'],
    [ '-', '-','-', 'p2', '-','p2', '-', '-','-'],
                ['p2', '-', 'p2'],
                ['p2', '-', 'p2'],
                ['p2', '-', 'p2']
]).

% The possible moves for a marble are represented as a list of tuples, where each tuple contains the starting coordinates and the ending coordinates of the move
% In this example, the moves are limited to moving just horizontally or vertically
% Generate a list of all the possible moves
% Generate a list of all the possible moves
findall((X1, Y1, X2, Y2), (between(1, 3, X1), between(1, 2, Y1), X2 is X1, Y2 is Y1 + 1;
                         between(4, 6, X1), between(1, 8, Y1), X2 is X1 , Y2 is Y1 +1;
                         between(7, 9, X1), between(1, 2, Y1), X2 is X1, Y2 is Y1 + 1;
                         % generate vertical moves
                         between(1, 2, X1), between(1, 3, Y1), X2 is X1 + 1, Y2 is Y1;
                         between(3,3, X1), between(1, 3, Y1), X2 is X1 + 1, Y2 is Y1+3;
                         between(4, 5, X1), between(1, 3, Y1), X2 is X1 + 1, Y2 is Y1;
                         between(4, 5, X1), between(4, 6, Y1), X2 is X1 + 1, Y2 is Y1;
                         between(4, 5, X1), between(7, 9, Y1), X2 is X1 + 1, Y2 is Y1;
                         between(6, 6, X1), between(4, 6, Y1), X2 is X1 + 1, Y2 is Y1-3;
                         between(7, 8, X1), between(1, 3, Y1), X2 is X1 + 1, Y2 is Y1;
                                       

                         %edges vertical
                         between(1, 1, X1), between(1, 3, Y1), X2 is 9, Y2 is Y1;
                         between(4,4, X1), between(1, 3, Y1), X2 is 6, Y2 is Y1;
                         between(4,4, X1), between(7, 9, Y1), X2 is 6, Y2 is Y1;
                         %edges horizontal
                         between(1, 3, X1), between(1, 1, Y1), X2 is X1, Y2 is 3;
                         between(7, 9, X1), between(1, 1, Y1), X2 is X1, Y2 is 3;
                         between(4, 6, X1), between(1, 1, Y1), X2 is X1, Y2 is 9;       
                          ), AllMoves).

% if player wants to move a marble from directly from edge to edge he needs specify that when playing

% The main predicate for the game
% The first argument is the player (1 for player 1, 2 for player 2)
% The second argument is the board
wana(Player, Board) :-
  % Check if the game is over (either a player has won or there are no more moves)
  (game_over(Board) ->
    write('Game over');
    % Get the possible moves for the current player
    moves(Moves),
    % Find a valid move for the current player
    member((X1, Y1, X2, Y2), Moves),
    % Check if the starting position is occupied by the current player's marble
    nth1(Y1, nth1(X1, Board, Row), 'x'),
    % Check if the ending position is empty
    nth1(Y2, nth1(X2, Board, Row), '-'),
    % Make the move and update the board
    set_board(X1, Y1, X2, Y2, Board, NewBoard),
    % Switch to the other player and continue the game
    (Player = 1 -> NextPlayer = 2; NextPlayer = 1),
    wana(NextPlayer, NewBoard)
  ).

% Predicate to check if the game is over
game_over(Board) :-
  % Check if either player has won
  (player_won(1, Board) -> true; player_won(2, Board) -> true;
  % Check if there are no more moves
  \+move_possible(Board)).

% Predicate to check if a player has won
player_won(Player, Board) :-
  % Check if all of the marbles of the other player are trapped
  (Player = 1 -> OtherPlayer = 2; OtherPlayer = 1),
  \+move_possible_for_player(OtherPlayer, Board).

% Predicate to check if there are any possible moves
move_possible(Board) :-
  moves(Moves),
  member((X1, Y1, X2, Y2), Moves),
  nth1(Y1, nth1(X1
