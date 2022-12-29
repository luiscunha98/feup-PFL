%Consults
:- consult('utils.pl').
:- consult('io.pl').

:- consult('menu/menu_io.pl').
:- consult('menu/menu.pl').

%Main Menu
play :- mainMenu.