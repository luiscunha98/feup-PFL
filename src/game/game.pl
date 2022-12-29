:-use_module(library(random)).

startGame(P1, P2) :-
	boardSize(Size),
	initial_state(Size, gameState(TurnNumber, Board, player(PLAYER1), player(PLAYER2))),
	display_game(gameState(TurnNumber, Board, player(PLAYER1), player(PLAYER2))),
	get_code(_),
	game_cycle(gameState(TurnNumber, Board, player(PLAYER1), player(PLAYER2))).

initial_state(Size, gameState(TurnNumber, Board, _, _)) :-
	TurnNumber is 1,
	initial_board(Size, Board).

