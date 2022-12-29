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
mainMenuChoice(0) :- exitGame.
%mainMenuChoice(1) :- startGame. % Start Game
mainMenuChoice(2) :- help. % Rules


% Exit the Game
exitGame :-
    clear, nl,
    menuFill,
    menuText('Thank You!'),
    menuFill.

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