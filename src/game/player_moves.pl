:- consult('board.pl').


% possible moves that can be made by the player:
%moves need to be like the below definition and be connected directly or indirectly (through other nodes) to the node that the player is currently on

%check if the

%vertical move
% if the node chosen is empty, none of the pieces are in the way, and the move is vertical, then the move is valid

% horizontal move
%if the node chosen is empty, none of the pieces are in the way, and the move is horizontal, then the move is valid

%circular move
%if the node chosen is empty, none of the pieces are in the way, and the move is circular, then the move is valid
%moves between the extreme nodes of rows 1,2,3, 7, 8, 9 and columns 1, 2, 3, 7, 8, 9 of rows 4, 5, and 6 are  circular moves

%check if the move is valid:
%if any of the 3 above is true:
    %for the one is true:
        %check if any of the opponent's pieces are in the way of the move (on the circular, horizontal, or vertical)

% after checking move validation we change the board configuration ( new board/different nodes graph values) and update the board(change the node value to the player's value representing the player's piece on the board)
% otherwise if none of the 3 is true, then the move is invalid and the player cannot move to that node we ask for a new possible valid move

%check if one of the current turn player's pieces is totally surrounded by the opponent's pieces





%