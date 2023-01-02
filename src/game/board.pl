:- use_module(library(lists)).
:- use_module(library(ugraphs)).
:- use_module(library(clpfd)).

%The board size in this game is always 9 (?)
%board(+Size).
boardSize(9).

%initial_board/1 -> initializes the board with pieces in their initial position
%initial_board(+Size, -Board) 
initial_board(Size, Board) :-
    createBoard(EmptyBoard),
    fillBoard(EmptyBoard, Size, Board), !.

%Row number 0 is the first row in the board.
%Using S since X and Y start at 1. So if we think about a for loop it would be for(i=1;i<3,i++) and it would only replace 2 elements...
%this way we have for(i=1,i<4;i++)
%fillBoard(+EmptyBoard,+Size, -Board)
fillBoard(EmptyBoard, Size, Board) :-
    S is Size+1,
    fillRow(EmptyBoard, piece(block), 1, 1, 4, B1),
    fillRow(B1, piece(block), 2, 1, 4, B2),
    fillRow(B2, piece(block), 3, 1, 4, B3),
    fillRow(B3, piece(block), 7, 1, 4, B4),
    fillRow(B4, piece(block), 8, 1, 4, B5),
    fillRow(B5, piece(block), 9, 1, 4, B6),
    setPiece(B6, 1, 4, piece(black), B7),
    setPiece(B7, 2, 4, piece(black), B8),
    setPiece(B8, 3, 4, piece(black), B9),
    setPiece(B9, 4, 4, piece(black), B10),
    setPiece(B10, 1, 6, piece(black), B11),
    setPiece(B11, 2, 6, piece(black), B12),
    setPiece(B12, 3, 6, piece(black), B13),
    setPiece(B13, 4, 6, piece(black), B14),
    setPiece(B14, 1, 7, piece(block), B15),
    setPiece(B15, 1, 8, piece(block), B16),
    setPiece(B16, 1, 9, piece(block), B17),
    setPiece(B17, 2, 7, piece(block), B18),
    setPiece(B18, 2, 8, piece(block), B19),
    setPiece(B19, 2, 9, piece(block), B20),
    setPiece(B20, 3, 7, piece(block), B21),
    setPiece(B21, 3, 8, piece(block), B22),
    setPiece(B22, 3, 9, piece(block), B23),
    setPiece(B23, 7, 7, piece(block), B24),
    setPiece(B24, 7, 8, piece(block), B25),
    setPiece(B25, 7, 9, piece(block), B26),
    setPiece(B26, 8, 7, piece(block), B27),
    setPiece(B27, 8, 8, piece(block), B28),
    setPiece(B28, 8, 9, piece(block), B29),
    setPiece(B29, 9, 7, piece(block), B30),
    setPiece(B30, 9, 8, piece(block), B31),
    setPiece(B31, 9, 9, piece(block), B32),
    setPiece(B32, 6, 4, piece(white), B33),
    setPiece(B33, 7, 4, piece(white), B34),
    setPiece(B34, 8, 4, piece(white), B35),
    setPiece(B35, 9, 4, piece(white), B36),
    setPiece(B36, 6, 6, piece(white), B37),
    setPiece(B37, 7, 6, piece(white), B38),
    setPiece(B38, 8, 6, piece(white), B39),
    setPiece(B39, 9, 6, piece(white), Board),
    write(' X -> Black //'),
    write(' O -> White //'),
    write(' # -> Block //'),
    write(' . -> Empty'),
    nl.
    






 
 
%Fills a whole row Row with the piece Piece
%fillRow(+Board, +Piece, -NewBoard).
fillRow(Board, _, _, Size, Size, Board) :- !.
fillRow(Board, Piece, X, Acc, Size, NewBoard) :-
    setPiece(Board, X, Acc, Piece, NewB),
    Acc1 is Acc+1,
    fillRow(NewB, Piece, X, Acc1, Size, NewBoard).


%createBoard/1 -> Creates an "empty" board (list of lists) filled with nulls
%createBoard(-ListOfLists)
createBoard(ListOfLists) :-
    boardSize(Size),
    createBoard(ListOfLists, Size, Size, []).

%createBoard(-ListOfLists, +Size, +Size, +Aux)
createBoard(ListOfLists, 0, _, ListOfLists) :- !.
createBoard(ListOfLists, Size, RowSize, Aux) :-
    createRow(Row,RowSize),
    append(Aux, [Row], Aux1),
    N is Size-1,
    createBoard(ListOfLists, N, RowSize, Aux1).

%createRow/1 -> Creates an empty row (filles with nulls)
%createRow(-Row,+Size).
createRow(_,0) :- !.
createRow([Head | Tail], Size) :-
    Head = piece(none),
    S is Size-1,
    createRow(Tail, S).