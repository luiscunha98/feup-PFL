

:- use_module(library(test_sicstus)).

% Consults

:- consult('game/board.pl').

% tests for all connectios from the board

test(all_connections) :-
    forall((node(X), node(Y)), (connected(X, Y) -> true ; (format('~w and ~w are not connected~n', [X, Y]), fail))).

% Run the test case
:- run_tests.
