% consult('display.pl').
% consult('game.pl').

:- use_module(library(lists)).
% The board is represented as a 9x9 matrix, where each element is either e (empty) or r (marble).

% The predicate initial_board(-Board) generates the initial board, where each player has 8 marbles.
initial_board(Board) :-
    Board = [
        [e,e,e,p1,e,p1,e,e,e],
        [e,e,e,p1,e,p1,e,e,e],
        [e,e,e,p1,e,p1,e,e,e],
        [e,e,e,p1,e,p1,e,e,e],
        [e,e,e,e,e,e,e,e,e],
        [e,e,e,p2,e,p2,e,e,e],
        [e,e,e,p2,e,p2,e,e,e],
        [e,e,e,p2,e,p2,e,e,e],
        [e,e,e,p2,e,p2,e,e,e]
    ].

% The predicate move(Board, From, To, NewBoard) succeeds if it is possible to make the move from position From to position To on the given board, resulting in a new board NewBoard.
move(Board, (FromRow, FromCol), (ToRow, ToCol), NewBoard) :-
    % Check if the marble at position From is a marble belonging to the current player.
    nth0(FromRow, Board, Row),
    nth0(FromCol, Row, Marble),
    (Marble = p1 ; Marble = p2),
    % Check if the destination position is empty.
    nth0(ToRow, Board, ToRowList),
    nth0(ToCol, ToRowList, e),
    % Check if the move is valid: the marble must be a marble, and it must move in a straight line.
    marble_move((FromRow, FromCol), (ToRow, ToCol)),
    % Check if there are no marbles blocking the path.
    \+ marble_between(Board, (FromRow, FromCol), (ToRow, ToCol)),
    % Update the board.
    update_board(Board, (FromRow, FromCol), (ToRow, ToCol), NewBoard).

% The predicate marble_move(From, To) succeeds if the move from position From to position To is a valid move for a marble.
marble_move((FromRow, FromCol), (ToRow, ToCol)) :-
    FromRow =:= ToRow ; FromCol =:= ToCol.

% The predicate marble_between(Board, From, To) succeeds if there is a marble between positions From and To on the given board.
marble_between(Board, (FromRow, FromCol), (ToRow, ToCol)) :-
    % Check if the move is along a row.
    FromRow =:= ToRow,
    % Check if there is a marble between the two columns.
    BetweenCol is min(FromCol, ToCol) + 1,
    max(FromCol, ToCol) - 1 is BetweenCol + 1,
    nth0(FromRow, Board, Row),
    nth0(BetweenCol, Row, p1),
    nth0(BetweenCol, Row, p2).
marble_between(Board, (FromRow, FromCol), (ToRow, ToCol)) :-
    % Check if the move is along a column.
    FromCol =:= ToCol,
    % Check if there is a marble between the two rows.
    BetweenRow is min(FromRow, ToRow) + 1,
    max(FromRow, ToRow) - 1 is BetweenRow + 1,
    nth0(BetweenRow, Board, Row),
    nth0(FromCol, Row, p1),
    nth0(FromCol, Row, p2).

% The predicate update_board(Board, From, To, NewBoard) updates the board by moving the Marble at position From to position To, resulting in a new board NewBoard.
update_board(Board, (FromRow, FromCol), (ToRow, ToCol), NewBoard) :-
    % Get the Marble at position From.
    nth0(FromRow, Board, Row),
    nth0(FromCol, Row, Marble),
    % Update the board by replacing the element at position From with an empty square and the element at position To with the Marble.
    replace(Board, FromRow, FromCol, e, TempBoard),
    replace(TempBoard, ToRow, ToCol, Marble, NewBoard).

% The predicate replace(List, Index, Element, NewList) replaces the element at the given index in the given list with the given element, resulting in a new list NewList.
replace([_|Tail], 0, Element, [Element|Tail]).
replace([Head|Tail], Index, Element, [Head|NewTail]) :-
    Index > 0,
    NewIndex is Index - 1,
    replace(Tail, NewIndex, Element, NewTail).

get_piece(Board, Row, Col, Marble) :-
    % Get the row at the given position.
    nth0(Row, Board, RowList),
    % Get the element at the given position in the row.
    nth0(Col, RowList, Marble),
    (Marble = p1 ; Marble = p2).

% letter_representation(+Piece, -Letter)
letter_representation(p1, 'p1').
letter_representation(p2, 'p2').
letter_representation(e, '.').

% print_board(+Board)
print_board(Board) :-
    maplist(print_row, Board).

% print_row(+Row)
print_row(Row) :-
    maplist(letter_representation, Row, Letters),
    atomic_list_concat(Letters, ' ', Atom),
    write(Atom), nl.
