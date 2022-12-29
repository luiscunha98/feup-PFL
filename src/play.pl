%Consults
:- consult('utils.pl').
:- consult('io.pl').

:- consult('game/game.pl').
:- consult('game/display.pl').

:- consult('menu/menu_io.pl').
:- consult('menu/menu.pl').

%Main Menu
play :- mainMenu.