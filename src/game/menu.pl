:- consult('play.pl').

% Main Menu 
mainMenu :-
    repeat, 
    clear,
    menuTitle('WANA'),
    menuEmptyLine,
    menuText('Main Menu:'),
    menuEmptyLine,
    menuOptionsHeader('Options', 'Description'),
    menuEmptyLine,
    menuOption(1, 'Start Game!'),
    menuOption(2, 'Help'),
    menuEmptyLine,
    menuOption(0, 'Exit Game'),
    menuEmptyLine,
    menuText('Game Made by: Wana_3'),
    menuFill, nl,
    readUntilBetween(0, 2, Num),
    mainMenuChoice(Num).

%mainMenu Choice
mainMenuChoice(0) :- exitGame. % Exit Game
mainMenuChoice(1) :- gameMenu. % Game Menu
mainMenuChoice(2) :- help. % Rules


% Exit the Game
exitGame :-
    clear, nl,
    menuFill,
    menuText('Thank You!'),
    menuFill.

%Game Menu
gameMenu:-
    repeat, 
    clear,
    menuTitle('WANA'),
    menuEmptyLine,
    menuText('Game Settings:'),
    menuEmptyLine,
    menuOptionsHeader('Options', 'Description'),
    menuEmptyLine,
    menuOption(1, 'Player vs player'),
    menuOption(2, 'Player vs Computer'),
    menuOption(3, 'Computer vs Computer'),
    menuEmptyLine,
    menuOption(0, 'Exit Game'),
    menuEmptyLine,
    menuText('Game Made by: Wana_3'),
    menuFill, nl,
    readUntilBetween(0, 3, Num),
    gameMenuChoice(Num).

% GameMenu Choice
gameMenuChoice(0) :- exitGame.
gameMenuChoice(1) :- ppgame. % Player vs Player Game
gameMenuChoice(2) :- pcgame. % Player vs Computer Game
gameMenuChoice(3) :- ccgame. % Computer vs Computer Game

ppgame:-
    play(player_1).

pcgame:-
   
    play2(cl_easy_1).

ccgame:-
    play3(cl_easy_1).

% help
help :-
    clear,
    menuTitle('Instructions'),
    menuEmptyLine,
    displayHelp,
    menuEmptyLine,
    menuFill, nl,
    write('Press Enter to go back to the Main Menu'),
    skip_line,
    fail. % Go back to menu


chooseDiff(Text, Choice) :-
    clear,
    menuTitle('Choose Difficulty'),
    menuEmptyLine,
   
    menuText(Text),
    menuEmptyLine,
    menuOptionsHeader('Options', 'Description'),
    menuEmptyLine,   
    menuOption(1, 'Medium'),
    menuOption(2, 'Hard'),
    menuEmptyLine,
    menuFill, nl,
    readUntilBetween(1, 2, Num),
    diffMap(Num, Choice).

diffMap(1, m).
diffMap(2, h).
