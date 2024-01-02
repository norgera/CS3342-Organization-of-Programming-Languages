magic_square(S) :-
    S = [A,B,C,D,E,F,G,H,I],
    permutation([1,2,3,4,5,6,7,8,9],[A,B,C,D,E,F,G,H,I]),
    % check rows
    A+B+C =:= D+E+F,
    D+E+F =:= G+H+I,
    % check columns
    A+D+G =:= B+E+H,
    B+E+H =:= C+F+I,
    % check diagonals
    A+E+I =:= C+E+G.