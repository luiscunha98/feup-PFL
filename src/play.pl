%Consults
:- consult('utils.pl').

:- consult('game/game.pl').
:- consult('game/display.pl').
:- consult('game/board.pl').

:- consult('menu/menu_io.pl').
:- consult('menu/menu.pl').

%Main Menu
play :- mainMenu.