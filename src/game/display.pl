
printPiece(piece(white)) :- write(' O ').

printPiece(piece(black)) :- write(' X ').

printPiece(piece(none))  :- write(' . ').

printPiece(piece(block)) :- write(' # ').

display_game(gameState(_, Board, _, _)) :-
	% nl, write('   1  2  3  4  5  6  7  '), nl,
	boardSize(Size),
	nl, write('   '), print1Line(Size, 1),
	display_lines(Board, 1).

print1Line(0, _) :- nl, !.
print1Line(Size, Num) :- write(Num), write('  '), N1 is Num +1, Size1 is Size -1, print1Line(Size1, N1).

display_lines([], _).
display_lines([Head|Tail], N) :- write(N), write(' '), display_line(Head), nl, N1 is N +1, display_lines(Tail, N1).

display_line([]).
display_line([Piece|Tail]) :- printPiece(Piece), display_line(Tail).
