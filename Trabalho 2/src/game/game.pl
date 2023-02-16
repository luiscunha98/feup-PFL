:-use_module(library(random)).

startGame(P1, P2) :-
	boardSize(Size),
	initial_state(Size, gameState(TurnNumber, Board, player(P1), player(P2))),
	display_game(gameState(TurnNumber, Board, player(P1), player(P2))).


% initial_state(+Size, -GameState)
initial_state(Size, gameState(TurnNumber, Board, _, _)) :-
	TurnNumber is 1,
	initial_board(Size, Board).

printPlayerTurn(Player) :-
	format('>> Your turn, ~p <<~n~n', [Player]).