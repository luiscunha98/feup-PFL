:- use_module(library(lists)).
% Define the nodes and edges of the graph (one node for each position on the board) that represent the board wana game

% Maybe we need to save on node values for line,column and value(p1/p2 players piece) of the node

% create nodes for the 1st row
node(l11).
node(l12).
node(l13).
% create nodes for the 2nd row
node(l21).
node(l22).
node(l23).
% create nodes for the 3rd row
node(l31).
node(l32).
node(l33).
% create nodes for the 4th row
node(l41).
node(l42).
node(l43).
node(l44).
node(l45).
node(l46).
node(l47).
node(l48).
node(l49).
% create nodes for the 5th row
node(l51).
node(l52).
node(l53).
node(l54).
node(l55).
node(l56).
node(l57).
node(l58).
node(l59).
% create nodes for the 6th row
node(l61).
node(l62).
node(l63).
node(l64).
node(l65).
node(l66).
node(l67).
node(l68).
node(l69).
% create nodes for the 7th row
node(l71).
node(l72).
node(l73).
% create nodes for the 8th row
node(l81).
node(l82).
node(l83).
% create nodes for the 9th row
node(l91).
node(l92).
node(l93).

%edges for all the nodes of the board game


% bidirectional edges for the 1st row with edge nodes linked eg: l11->l12 and l12->l11 , l13->l11 and so on
edge(l11,l12).
edge(l12,l11).
edge(l12,l13).
edge(l13,l12).
edge(l13,l11).
edge(l11,l13).

% circular bidirectional edges for the 1st row with other rows eg: l11->l41 and l41->l11 or l11->l49 and l49->l11

% with row 4
edge(l11,l41).
edge(l41,l11).
edge(l11,l49).
edge(l49,l11).



% bidirectional edges for the 2st row with edge nodes linked eg: l11->l12 and l12->l11 , l13->l11 and so on

edge(l21,l22).
edge(l22,l21).
edge(l22,l23).
edge(l23,l22).
edge(l23,l21).
edge(l21,l23).

% circular bidirectional edges for the 2st row with other rows eg: l21->l42 and l42->l21 or l23->l48 and l48->l23

% with row 4

edge(l21,l42).
edge(l42,l21).
edge(l23,l48).
edge(l48,l23).


% bidirectional edges for the 1st row with row 2 ( all elements): l11->l21 and l21->l11 , l13->l23 l23->l13 and so on

edge(l11,l21).
edge(l21,l11).
edge(l12,l22).
edge(l22,l12).
edge(l13,l23).
edge(l23,l13).

% bidirectional edges for row 2 with row 3 ( all elements): l21->l31 and l31->l21 , l23->l33 l33->l23 and so on

edge(l21,l31).
edge(l31,l21).
edge(l22,l32).
edge(l32,l22).
edge(l23,l33).
edge(l33,l23).


% bidirectional edges for row 3 with row 4 ( all elements): l31->l44 and l44->l31 , l33->l46 l46->l33 and so on

edge(l31,l44).
edge(l44,l31).
edge(l32,l45).
edge(l45,l32).
edge(l33,l46).
edge(l46,l33).



% bidirectional edges for the 3st row with edge nodes linked eg: l11->l12 and l12->l11 , l13->l11 and so on

edge(l31,l32).
edge(l32,l31).
edge(l32,l33).
edge(l33,l32).
edge(l33,l31).
edge(l31,l33).

% circular bidirectional edges for the 3st row with other rows eg: l31->l43 and l43->l31 or l33->l47 and l47->l33

% with row 4

edge(l31,l43).
edge(l43,l31).
edge(l33,l47).
edge(l47,l33).



% bidirectional edges for the 4th row with edge nodes linked eg: l41->l42 and l42->l41 , l49->l41 and so on

edge(l41,l42).
edge(l42,l41).
edge(l42,l43).
edge(l43,l42).
edge(l43,l44).
edge(l44,l43).
edge(l44,l45).
edge(l45,l44).
edge(l45,l46).
edge(l46,l45).
edge(l46,l47).
edge(l47,l46).
edge(l47,l48).
edge(l48,l47).
edge(l48,l49).
edge(l49,l48).
edge(l49,l41).
edge(l41,l49).

% circular bidirectional edges for the 4st row with other rows eg: l41->l51 and l51->l41 or l49->l59 and l59->l49 and so on

% with all elements of row 5

edge(l41,l51).
edge(l51,l41).
edge(l42,l52).
edge(l52,l42).
edge(l43,l53).
edge(l53,l43).
edge(l44,l54).
edge(l54,l44).
edge(l45,l55).
edge(l55,l45).
edge(l46,l56).
edge(l56,l46).
edge(l47,l57).
edge(l57,l47).
edge(l48,l58).
edge(l58,l48).
edge(l49,l59).
edge(l59,l49).


% bidirectional edges for the 5th row with edge nodes linked eg: l51->l52 and l52->l51 , l59->l51 and so on

edge(l51,l52).
edge(l52,l51).
edge(l52,l53).
edge(l53,l52).
edge(l53,l54).
edge(l54,l53).
edge(l54,l55).
edge(l55,l54).
edge(l55,l56).
edge(l56,l55).
edge(l56,l57).
edge(l57,l56).
edge(l57,l58).
edge(l58,l57).
edge(l58,l59).
edge(l59,l58).
edge(l59,l51).
edge(l51,l59).

% circular bidirectional edges for the 5st row with other rows eg: l51->l61 and l61->l51 or l59->l69 and l69->l59 and so on

% with all elements of row 6

edge(l51,l61).
edge(l61,l51).
edge(l52,l62).
edge(l62,l52).
edge(l53,l63).
edge(l63,l53).
edge(l54,l64).
edge(l64,l54).
edge(l55,l65).
edge(l65,l55).
edge(l56,l66).
edge(l66,l56).
edge(l57,l67).
edge(l67,l57).
edge(l58,l68).
edge(l68,l58).
edge(l59,l69).
edge(l69,l59).



% bidirectional edges for the 6th row with edge nodes linked eg: l61->l62 and l62->l61 , l69->l61 and so on

edge(l61,l62).
edge(l62,l61).
edge(l62,l63).
edge(l63,l62).
edge(l63,l64).
edge(l64,l63).
edge(l64,l65).
edge(l65,l64).
edge(l65,l66).
edge(l66,l65).
edge(l66,l67).
edge(l67,l66).
edge(l67,l68).
edge(l68,l67).
edge(l68,l69).
edge(l69,l68).
edge(l69,l61).
edge(l61,l69).


% circular bidirectional edges for the 6st row with other rows eg: l63->l71 and l71->l63 or l67->l73 and l73->l67 and so on

% with  elements of row 7 (2 elements)

edge(l63,l71).
edge(l71,l63).
edge(l67,l73).
edge(l73,l67).

% with  elements of row 8 (2 elements)

edge(l62,l81). 
edge(l81,l62).
edge(l68,l83).
edge(l83,l68).

% with  elements of row 9 (2 elements)

edge(l61,l91).
edge(l91,l61).
edge(l69,l93).
edge(l93,l69).


% bidirectional edges for the 7th row with edge nodes linked eg: l71->l72 and l72->l71 , l73->l71 and so on

edge(l71,l72).
edge(l72,l71).
edge(l72,l73).
edge(l73,l72).
edge(l73,l71).
edge(l71,l73).


% bidirectional edges for the 8th row with edge nodes linked eg: l81->l82 and l82->l81 , l83->l81 and so on

edge(l81,l82).
edge(l82,l81).
edge(l82,l83).
edge(l83,l82).
edge(l83,l81).
edge(l81,l83).

% bidirectional edges for the 9th row with edge nodes linked eg: l91->l92 and l92->l91 , l93->l91 and so on

edge(l91,l92).
edge(l92,l91).
edge(l92,l93).
edge(l93,l92).
edge(l93,l91).
edge(l91,l93).

% bidirectional edges for the 6st row with row 7 ( all elements): eg:  l64->l71 and l71->l64 or l66->l73 and l73->l66 and so on

edge(l64,l71).
edge(l71,l64).
edge(l65,l72).
edge(l72,l65).
edge(l66,l73).
edge(l73,l66).

% bidirectional edges for the 7st row with row 8 ( all elements): eg: l71->l81 and l81->l71 or l73->l83 and l83->l73 and so on

edge(l71,l81).
edge(l81,l71).
edge(l72,l82).
edge(l82,l72).
edge(l73,l83).
edge(l83,l73).

% bidirectional edges for the 8st row with row 9 ( all elements): eg: l81->l91 and l91->l81 or l83->l93 and l93->l83 and so on

edge(l81,l91).
edge(l91,l81).
edge(l82,l92).
edge(l92,l82).
edge(l83,l93).
edge(l93,l83).


% Define the connected/2 predicate
connected(X, Y) :- edge(X, Y). % base case: X and Y are directly connected
connected(X, Y) :-              % recursive case: X and Y are connected through a third ( or more nodes) node Z
    edge(X, Z),
    connected(Z, Y).


