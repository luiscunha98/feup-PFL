:- use_module(library(lists)).
:- use_module(library(ugraphs)).
:- use_module(library(clpfd)).

% Define the nodes and edges of the graph (one node for each position on the board) that represent the board wana game

% Maybe we need to save on node values for line,column and value(p1/p2 players piece) of the node
% A position is represented as a triplet (X, Y, Value)
% where X and Y are integers in the range 1-7 and Value is an integer in the range 0-2
position(X, Y, Value) :-
    between(1, 9, X),
    between(1, 9, Y),
    between(0, 2, Value).

% Define the graph that represents the board game
graph(Graph) :-
% create nodes for the 1st row
    vertices(Graph, [
    position(1,1,0),
    position(1,2,0),
    position(1,3,0),
    % create nodes for the 2nd row
    position(2,1,0),
    position(2,2,0),
    position(2,3,0),
    % create nodes for the 3rd row
    position(3,1,0),
    position(3,2,0),
    position(3,3,0),
    % create nodes for the 4th row
    position(4,1,0),
    position(4,2,0),
    position(4,3,0),
    position(4,4,0),
    position(4,5,0),
    position(4,6,0),
    position(4,7,0),
    position(4,8,0),
    position(4,9,0),
    % create nodes for the 5th row
    position(5,1,0),
    position(5,2,0),
    position(5,3,0),
    position(5,4,0),
    position(5,5,0),
    position(5,6,0),
    position(5,7,0),
    position(5,8,0),
    position(5,9,0),
    % create nodes for the 6th row
    position(6,1,0),
    position(6,2,0),
    position(6,3,0),
    position(6,4,0),
    position(6,5,0),
    position(6,6,0),
    position(6,7,0),
    position(6,8,0),
    position(6,9,0),
    % create nodes for the 7th row
    position(7,1,0),
    position(7,2,0),
    position(7,3,0),
    % create nodes for the 8th row
    position(8,1,0),
    position(8,2,0),
    position(8,3,0),
    % create nodes for the 9th row
    position(9,1,0),
    position(9,2,0),
    position(9,3,0)
    ]),

% add_vertices([], Vertices,NG).
%edges for all the nodes of the board game


% bidirectional edges for the 1st row with edge nodes linked eg: l11->l12 and l12->l11 , l13->l11 and so on
edges(Graph,[ position(1,1,0)-position(1,2,0),
position(1,2,0)-position(1,1,0),
position(1,2,0)-position(1,3,0),
position(1,3,0)-position(1,2,0),
position(1,3,0)-position(1,1,0),
position(1,1,0)-position(1,3,0),

% circular bidirectional edges for the 1st row with other rows eg: l11->l41 and l41->l11 or l11->l49 and l49->l11

% with row 4
position(1,1,0)-position(4,1,0),
position(4,1,0)-position(1,1,0),
position(1,1,0)-position(4,9,0),
position(4,9,0)-position(1,1,0),


% bidirectional edges for the 2st row with edge nodes linked eg: l11->l12 and l12->l11 , l13->l11 and so on

position(2,1,0)-position(2,2,0),
position(2,2,0)-position(2,1,0),
position(2,2,0)-position(2,3,0),
position(2,3,0)-position(2,2,0),
position(2,3,0)-position(2,1,0),
position(2,1,0)-position(2,3,0),


% circular bidirectional edges for the 2st row with other rows eg: l21->l42 and l42->l21 or l23->l48 and l48->l23

% with row 4

position(2,1,0)-position(4,2,0),
position(4,2,0)-position(2,1,0),
position(2,3,0)-position(4,8,0),
position(4,8,0)-position(2,3,0),


% bidirectionaposition( ,e,0)ges for the 1st row with row 2 ( aposition( ,e,0)osition(e,m,0)nts): position(1,1,0)>position(2,1,0)and position(2,1,0)>position(1,1,0), position(1,3,0)>position(2,3,0)position(2,3,0)>position(1,3,0)and so on

position(1,1,0)-position(2,1,0),
position(2,1,0)-position(1,1,0),
position(1,2,0)-position(2,2,0),
position(2,2,0)-position(1,2,0),
position(1,3,0)-position(2,3,0),
position(2,3,0)-position(1,3,0),

% bidirectionaposition( ,e,0)ges for row 2 with row 3 ( aposition( ,e,0)osition(e,m,0)nts): position(2,1,0)>position(3,1,0)and position(3,1,0)>position(2,1,0), position(2,3,0)>position(3,3,0)position(3,3,0)>position(2,3,0)and so on

position(2,1,0)-position(3,1,0),
position(3,1,0)-position(2,1,0),
position(2,2,0)-position(3,2,0),
position(3,2,0)-position(2,2,0),
position(2,3,0)-position(3,3,0),
position(3,3,0)-position(2,3,0),


% bidirectionaposition( ,e,0)ges for row 3 with row 4 ( aposition( ,e,0)osition(e,m,0)nts): position(3,1,0)>position(4,4,0)and position(4,4,0)>position(3,1,0), position(3,3,0)>position(4,6,0)position(4,6,0)>position(3,3,0)and so on

position(3,1,0)-position(4,4,0),
position(4,4,0)-position(3,1,0),
position(3,2,0)-position(4,5,0),
position(4,5,0)-position(3,2,0),
position(3,3,0)-position(4,6,0),
position(4,6,0)-position(3,3,0),

% bidirectionaposition( ,e,0)ges for the 3st row with edge nodes position(i,n,0)ed eg: position(1,1,0)>position(1,2,0)and position(1,2,0)>position(1,1,0), position(1,3,0)>position(1,1,0)and so on

position(3,1,0)-position(3,2,0),
position(3,2,0)-position(3,1,0),
position(3,2,0)-position(3,3,0),
position(3,3,0)-position(3,2,0),
position(3,3,0)-position(3,1,0),
position(3,1,0)-position(3,3,0),

% circuposition(a,r,0)bidirectionaposition( ,e,0)ges for the 3st row with other rows eg: position(3,1,0)>position(4,3,0)and position(4,3,0)>position(3,1,0)or position(3,3,0)>position(4,7,0)and position(4,7,0)>position(3,3,0)
% with row 4

position(3,1,0)-position(4,3,0),
position(4,3,0)-position(3,1,0),
position(3,3,0)-position(4,7,0),
position(4,7,0)-position(3,3,0),

% bidirectionaposition( ,e,0)ges for the 4th row with edge nodes position(i,n,0)ed eg: position(4,1,0)>position(4,2,0)and position(4,2,0)>position(4,1,0), position(4,9,0)>position(4,1,0)and so on

position(4,1,0)-position(4,2,0),
position(4,2,0)-position(4,1,0),
position(4,2,0)-position(4,3,0),
position(4,3,0)-position(4,2,0),
position(4,3,0)-position(4,4,0),
position(4,4,0)-position(4,3,0),
position(4,4,0)-position(4,5,0),
position(4,5,0)-position(4,4,0),
position(4,5,0)-position(4,6,0),
position(4,6,0)-position(4,5,0),
position(4,6,0)-position(4,7,0),
position(4,7,0)-position(4,6,0),
position(4,7,0)-position(4,8,0),
position(4,8,0)-position(4,7,0),
position(4,8,0)-position(4,9,0),
position(4,9,0)-position(4,8,0),
position(4,9,0)-position(4,1,0),
position(4,1,0)-position(4,9,0),

% circuposition(a,r,0)bidirectionaposition( ,e,0)ges for the 4st row with other rows eg: position(4,1,0)>position(5,1,0)and position(5,1,0)>position(4,1,0)or position(4,9,0)>position(5,9,0)and position(5,9,0)>position(4,9,0)and so on

% with aposition( ,e,0)osition(e,m,0)nts of row 5

position(4,1,0)-position(5,1,0),
position(5,1,0)-position(4,1,0),
position(4,2,0)-position(5,2,0),
position(5,2,0)-position(4,2,0),
position(4,3,0)-position(5,3,0),
position(5,3,0)-position(4,3,0),
position(4,4,0)-position(5,4,0),
position(5,4,0)-position(4,4,0),
position(4,5,0)-position(5,5,0),
position(5,5,0)-position(4,5,0),
position(4,6,0)-position(5,6,0),
position(5,6,0)-position(4,6,0),
position(4,7,0)-position(5,7,0),
position(5,7,0)-position(4,7,0),
position(4,8,0)-position(5,8,0),
position(5,8,0)-position(4,8,0),
position(4,9,0)-position(5,9,0),
position(5,9,0)-position(4,9,0),

% bidirectionaposition( ,e,0)ges for the 5th row with edge nodes position(i,n,0)ed eg: position(5,1,0)>position(5,2,0)and position(5,2,0)>position(5,1,0), position(5,9,0)>position(5,1,0)and so on

position(5,1,0)-position(5,2,0),
position(5,2,0)-position(5,1,0),
position(5,2,0)-position(5,3,0),
position(5,3,0)-position(5,2,0),
position(5,3,0)-position(5,4,0),
position(5,4,0)-position(5,3,0),
position(5,4,0)-position(5,5,0),
position(5,5,0)-position(5,4,0),
position(5,5,0)-position(5,6,0),
position(5,6,0)-position(5,5,0),
position(5,6,0)-position(5,7,0),
position(5,7,0)-position(5,6,0),
position(5,7,0)-position(5,8,0),
position(5,8,0)-position(5,7,0),
position(5,8,0)-position(5,9,0),
position(5,9,0)-position(5,8,0),
position(5,9,0)-position(5,1,0),
position(5,1,0)-position(5,9,0),

% circuposition(a,r,0)bidirectionaposition( ,e,0)ges for the 5st row with other rows eg: position(5,1,0)>position(6,1,0)and position(6,1,0)>position(5,1,0)or position(5,9,0)>position(6,9,0)and position(6,9,0)>position(5,9,0)and so on

% with aposition( ,e,0)osition(e,m,0)nts of row 6

position(5,1,0)-position(6,1,0),
position(6,1,0)-position(5,1,0),
position(5,2,0)-position(6,2,0),
position(6,2,0)-position(5,2,0),
position(5,3,0)-position(6,3,0),
position(6,3,0)-position(5,3,0),
position(5,4,0)-position(6,4,0),
position(6,4,0)-position(5,4,0),
position(5,5,0)-position(6,5,0),
position(6,5,0)-position(5,5,0),
position(5,6,0)-position(6,6,0),
position(6,6,0)-position(5,6,0),
position(5,7,0)-position(6,7,0),
position(6,7,0)-position(5,7,0),
position(5,8,0)-position(6,8,0),
position(6,8,0)-position(5,8,0),
position(5,9,0)-position(6,9,0),
position(6,9,0)-position(5,9,0),

% bidirectionaposition( ,e,0)ges for the 6th row with edge nodes position(i,n,0)ed eg: position(6,1,0)>position(6,2,0)and position(6,2,0)>position(6,1,0), position(6,9,0)>position(6,1,0)and so on

position(6,1,0)-position(6,2,0),
position(6,2,0)-position(6,1,0),
position(6,2,0)-position(6,3,0),
position(6,3,0)-position(6,2,0),
position(6,3,0)-position(6,4,0),
position(6,4,0)-position(6,3,0),
position(6,4,0)-position(6,5,0),
position(6,5,0)-position(6,4,0),
position(6,5,0)-position(6,6,0),
position(6,6,0)-position(6,5,0),
position(6,6,0)-position(6,7,0),
position(6,7,0)-position(6,6,0),
position(6,7,0)-position(6,8,0),
position(6,8,0)-position(6,7,0),
position(6,8,0)-position(6,9,0),
position(6,9,0)-position(6,8,0),
position(6,9,0)-position(6,1,0),
position(6,1,0)-position(6,9,0),


% circuposition(a,r,0)bidirectionaposition( ,e,0)ges for the 6st row with other rows eg: position(6,3,0)>position(7,1,0)and position(7,1,0)>position(6,3,0)or position(6,7,0)>position(7,3,0)and position(7,3,0)>position(6,7,0)and so on

% with  eposition(e,m,0)nts of row 7 (2 eposition(e,m,0)nts)

position(6,3,0)-position(7,1,0),
position(7,1,0)-position(6,3,0),
position(6,7,0)-position(7,3,0),
position(7,3,0)-position(6,7,0),

% with  eposition(e,m,0)nts of row 8 (2 eposition(e,m,0)nts)

position(6,2,0)-position(8,1,0), 
position(8,1,0)-position(6,2,0),
position(6,8,0)-position(8,3,0),
position(8,3,0)-position(6,8,0),

% with  eposition(e,m,0)nts of row 9 (2 eposition(e,m,0)nts)

position(6,1,0)-position(9,1,0),
position(9,1,0)-position(6,1,0),
position(6,9,0)-position(9,3,0),
position(9,3,0)-position(6,9,0),

% bidirectionaposition( ,e,0)ges for the 7th row with edge nodes position(i,n,0)ed eg: position(7,1,0)>position(7,2,0)and position(7,2,0)>position(7,1,0), position(7,3,0)>position(7,1,0)and so on

position(7,1,0)-position(7,2,0),
position(7,2,0)-position(7,1,0),
position(7,2,0)-position(7,3,0),
position(7,3,0)-position(7,2,0),
position(7,3,0)-position(7,1,0),
position(7,1,0)-position(7,3,0),

% bidirectionaposition( ,e,0)ges for the 8th row with edge nodes position(i,n,0)ed eg: position(8,1,0)>position(8,2,0)and position(8,2,0)>position(8,1,0), position(8,3,0)>position(8,1,0)and so on

position(8,1,0)-position(8,2,0),
position(8,2,0)-position(8,1,0),
position(8,2,0)-position(8,3,0),
position(8,3,0)-position(8,2,0),
position(8,3,0)-position(8,1,0),
position(8,1,0)-position(8,3,0),

% bidirectionaposition( ,e,0)ges for the 9th row with edge nodes position(i,n,0)ed eg: position(9,1,0)>position(9,2,0)and position(9,2,0)>position(9,1,0), position(9,3,0)>position(9,1,0)and so on

position(9,1,0)-position(9,2,0),
position(9,2,0)-position(9,1,0),
position(9,2,0)-position(9,3,0),
position(9,3,0)-position(9,2,0),
position(9,3,0)-position(9,1,0),
position(9,1,0)-position(9,3,0),

% bidirectionaposition( ,e,0)ges for the 6st row with row 7 ( aposition( ,e,0)osition(e,m,0)nts): eg:  position(6,4,0)>position(7,1,0)and position(7,1,0)>position(6,4,0)or position(6,6,0)>position(7,3,0)and position(7,3,0)>position(6,6,0)and so on

position(6,4,0)-position(7,1,0),
position(7,1,0)-position(6,4,0),
position(6,5,0)-position(7,2,0),
position(7,2,0)-position(6,5,0),
position(6,6,0)-position(7,3,0),
position(7,3,0)-position(6,6,0),

% bidirectionaposition( ,e,0)ges for the 7st row with row 8 ( aposition( ,e,0)osition(e,m,0)nts): eg: position(7,1,0)>position(8,1,0)and position(8,1,0)>position(7,1,0)or position(7,3,0)>position(8,3,0)and position(8,3,0)>position(7,3,0)and so on

position(7,1,0)-position(8,1,0),
position(8,1,0)-position(7,1,0),
position(7,2,0)-position(8,2,0),
position(8,2,0)-position(7,2,0),
position(7,3,0)-position(8,3,0),
position(8,3,0)-position(7,3,0),

% bidirectionaposition( ,e,0)ges for the 8st row with row 9 ( aposition( ,e,0)osition(e,m,0)nts): eg: position(8,1,0)>position(9,1,0)and position(9,1,0)>position(8,1,0)or position(8,3,0)>position(9,3,0)and position(9,3,0)>position(8,3,0)and so on

position(8,1,0)-position(9,1,0),
position(9,1,0)-position(8,1,0),
position(8,2,0)-position(9,2,0),
position(9,2,0)-position(8,2,0),
position(8,3,0)-position(9,3,0),
position(9,3,0)-position(8,3,0)]).

% graph_connected is a predicate that checks if two nodes are connected in a graph

% graph_connected(+Graph, +Node1, +Node2) is true if Node1 and Node2 are connected in Graph
graph(Graph).
graph_connected(Graph, Node1, Node2) :-
    % Get the list of vertices and edges in the graph
    vertices(Graph, Vertices),
    edges(Graph, Edges),
    
    % Check if Node1 and Node2 are connected in the graph
    graph_connected(Vertices, Edges, Node1, Node2).

% graph_connected(+Vertices, +Edges, +Node1, +Node2) is true if Node1 and Node2 are connected in the graph with the given vertices and edges

graph_connected(Vertices, Edges, Node1, Node2) :-
    % Check if Node1 and Node2 are the same node
    Node1 = Node2.

graph_connected(Vertices, Edges, Node1, Node2) :-

    % Check if Node1 and Node2 are connected by an edge
    member(Node1-Node2, Edges).

graph_connected(Vertices, Edges, Node1, Node2) :-

    % Check if Node1 and Node2 are connected by a path
    member(Node1-Node3, Edges),
    graph_connected(Vertices, Edges, Node3, Node2).




% % graph_to_dot_string(+Graph, -String) generates a string representation of the graph Graph
% % in GraphViz DOT format.
% graph_to_dot_string(Graph, String) :-
%     % Get the list of vertices and edges in the graph
%     vertices(Graph, Vertices),
%     edges(Graph, Edges),
    
%     % Generate the string representation of the graph
%     graph_to_dot_string(Vertices, Edges, "", String).

% % graph_to_dot_string(+Vertices, +Edges, +Accumulator, -String) generates a string
% % representation of the graph with the given vertices and edges in GraphViz DOT format.
% graph_to_dot_string(Vertices, Edges, Accumulator, String) :-
%     % Add the header and footer to the string
%     string_concat("digraph G {\n", Accumulator, NewAccumulator),
%     string_concat(NewAccumulator, "}", NewAccumulator2),
    
%     % Generate the string representation of the vertices
%     vertices_to_dot_string(Vertices, "", VerticesString),
    
%     % Generate the string

% % vertices_to_dot_string(+Vertices, +Accumulator, -String) generates a string
% % representation of the list of vertices Vertices in GraphViz DOT format.
% vertices_to_dot_string([], String, String).
% vertices_to_dot_string([Vertex|Tail], Accumulator, String) :-
%     vertex_to_dot_string(Vertex, VertexString),
%     string_concat(Accumulator, VertexString, NewAccumulator),
%     vertices_to_dot_string(Tail, NewAccumulator, String).

% % vertex_to_dot_string(+Vertex, -String) generates a string representation of the
% % vertex Vertex in GraphViz DOT format.
% vertex_to_dot_string(Vertex, String) :-
%     % Generate the string representation of the vertex
%     format(string(String), "~w;\n", [Vertex]).

% % edges_to_dot_string(+Edges, +Accumulator, -String) generates a string
% % representation of the list of edges Edges in GraphViz DOT format.
% edges_to_dot_string([], String, String).
% edges_to_dot_string([Edge|Tail], Accumulator, String) :-
%     edge_to_dot_string(Edge, EdgeString),
%     string_concat(Accumulator, EdgeString, NewAccumulator),
%     edges_to_dot_string(Tail, NewAccumulator, String).

% % edge_to_dot_string(+Edge, -String) generates a string representation of the
% % edge Edge in GraphViz DOT format.
% edge_to_dot_string((Vertex1, Vertex2), String) :-
%     % Generate the string representation of the edge
%     format(string(String), "~w -> ~w;\n", [Vertex1, Vertex2]).

% % Generate the string representation of the graph and print it to the user
% graph(Graph),
% graph_to_dot_string(Graph, String),
% write(String).

% % graph_to_dot_string(+Vertices, +Edges, +Accumulator, -String) generates a string
% % representation of the graph with the given vertices and edges in GraphViz DOT format.
% graph_to_dot_string(Vertices, Edges, Accumulator, String) :-
%     % Generate the string representation of the vertices
%     vertices_to_dot_string(Vertices, "", VerticesString),
    
%     % Generate the string representation of the edges
%     edges_to_dot_string(Edges, "", EdgesString),
    
%     % Append the string representation of the vertices and edges to the accumulator
%     string_concat(Accumulator, VerticesString, NewAccumulator),
%     string_concat(NewAccumulator, EdgesString, NewAccumulator2),
    
%     % Add the header and footer to the string
%     string_concat("digraph G {\n", NewAccumulator2, NewAccumulator3),
%     string_concat(NewAccumulator3, "}", String).

% boardSize(9).

% %initial_board/1 -> initializes the board with pieces in their initial position
% %initial_board(+Size, -Board) 
% initial_board(Size, Board) :-
%     % boardSize(Size),
%     createBoard(EmptyBoard),
%     fillBoard(EmptyBoard, Size, Board), !.

% %Row number 0 is the first row in the board.
% %Using S since X and Y start at 1. So if we think about a for loop it would be for(i=1;i<3,i++) and it would only replace 2 elements...
% %this way we have for(i=1,i<4;i++)
% %fillBoard(+EmptyBoard,+Size, -Board)
% fillBoard(EmptyBoard, Size, Board) :-
%     S is Size+1,
%     fillRow(EmptyBoard, piece(black), 1, 1, S, B1),
%     fillRow(B1, piece(black), 2, 1, S, B2),
%     fillRow(B2, piece(white), 8, 1, S, B3),
%     fillRow(B3, piece(white), 9, 1, S, Board).

% %Fills a whole row Row with the piece Piece
% %fillRow(+Board, +Piece, -NewBoard).
% fillRow(Board, _, _, Size, Size, Board) :- !.
% fillRow(Board, Piece, X, Acc, Size, NewBoard) :-
%     setPiece(Board, X, Acc, Piece, NewB),
%     Acc1 is Acc+1,
%     fillRow(NewB, Piece, X, Acc1, Size, NewBoard).


% %createBoard/1 -> Creates an "empty" board (list of lists) filled with nulls
% %createBoard(-ListOfLists)
% createBoard(ListOfLists) :-
%     boardSize(Size),
%     createBoard(ListOfLists, Size, Size, []).

% %createBoard(-ListOfLists, +Size, +Size, +Aux)
% createBoard(ListOfLists, 0, _, ListOfLists) :- !.
% createBoard(ListOfLists, Size, RowSize, Aux) :-
%     createRow(Row,RowSize),
%     append(Aux, [Row], Aux1),
%     N is Size-1,
%     createBoard(ListOfLists, N, RowSize, Aux1).

% %createRow/1 -> Creates an empty row (filles with nulls)
% %createRow(-Row,+Size).
% createRow(_,0) :- !.
% createRow([Head | Tail], Size) :-
%     Head = piece(none),
%     S is Size-1,
%     createRow(Tail, S).

% %Users have the option of picking different board sizes
% chooseBoardSize :- 
%     write('Choose Board Size: '), 
%     read(Size), 
%     assert(boardSize(Size)), !.