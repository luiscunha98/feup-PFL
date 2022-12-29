:- consult('board.pl').


% possible moves that can be made by the player

%moves need to be like the below definition and be connected directly or indirectly (through other nodes) to the node that the player is currently on

%vertical move
% if the node chosen is empty, none of the pieces are in the way, and the move is vertical, then the move is valid

% horizontal move
%if the node chosen is empty, none of the pieces are in the way, and the move is horizontal, then the move is valid

%circular move
%if the node chosen is empty, none of the pieces are in the way, and the move is circular, then the move is valid
%moves between the extreme nodes of rows 1,2,3, 7, 8, 9 and columns 1, 2, 3, 7, 8, 9 of rows 4, 5, and 6 are  circular moves


%horizontal move

%circular move