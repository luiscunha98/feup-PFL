
% Main Menu Title
menuTitle(Title) :-
    format('~n~`*t ~p ~`*t~75|~n', [Title]).


% menuOptionsHeader
% Displays the menu's options header
menuOptionsHeader(Options, Captions) :-
    format('*~t~p~t~37+~t~p~t~37+~t*~75|~n', [Options, Captions]).


% Main Menu Line 
% Displays a Empty Line
menuEmptyLine :-
    format('*~t*~75|~n', []).


% Menu Option
% Displays a menu's option
menuOption(Option, Caption) :-
    format('*~t~p~t~37|~t~p~t~37+~t*~75|~n', [Option, Caption]).



% menuTitle
% Displays regular text in the menu
menuText(Text) :-
    format('*~t~p~t*~75|~n', [Text]).



% menuFill/0
% Displays the filled line of the menu, formatted with 75 chars of width
menuFill :-
    format('~`*t~75|~n', []).



% Instructions
% Displays the game's instructions
displayHelp :-
    menuText('------------------------ Description ------------------------'),
    menuEmptyLine,
    menuText('In Wana the aim of the game is to trap one'),
    menuText('of your opponents marble by surrounding it with any  '),
    menuText('combination of your own or your opponents'),
    menuEmptyLine,


    menuText('------------------------ How To Play ------------------------'),
    menuEmptyLine,
    menuText('Each player has 8 marbles of their color.'),
    menuText('They are placed on divot at the intersection between the lines.'),
    menuText('On your turn you must move one of your marble. '),
    menuText('A marble can move as far as you want along a line.'),
    menuText('A marble that travel off the board will '),
    menuText('appear and continue traveling from the opposite side.'),
    menuText('If you have a marble that cannot be moved at '),
    menuText('the beginning of your turn you lose the game.'),
    menuEmptyLine,

    menuEmptyLine,
    menuText('Expert in battle moves the enemy,'),
    menuText('and its not moved by him, -Sun Tzu').

% ReadNumber
% Reads a number from input
readNumber(X) :- readNumber(X, 0).

readNumber(X, X) :-
    peek_code(10), !,
    skip_line.

readNumber(X, Acc) :-
    get_code(C),
    validDigit(C),
    Real is C - 48,
    Tmp is Acc * 10,
    Acc1 is Tmp + Real,
    readNumber(X, Acc1).

% readUntilBetween(+Min, +Max, -Value)
% Reads a number from input until the user inserts one between two values
readUntilBetween(Min, Max, Value) :-
    format('Choose an option [~d-~d]: ', [Min, Max]),
    readNumber(Value),
    between(Min, Max, Value), !.

readUntilBetween(Min, Max, Value) :-
    format('Invalid option! Please choose between ~d and ~d~n', [Min, Max]),
    readUntilBetween(Min, Max, Value).

% InvalidDigit
% Checks if the char is an invalid digit and clears input if so
invalidDigit(C) :-
    (C < 48 ; C > 57),
    skip_line.
    
validDigit(C) :- \+ invalidDigit(C), !.


% Clears the terminal screen
clear :- write('\e[2J').