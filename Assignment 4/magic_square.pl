% Prolog program magic_square.pl which computes all 3 × 3 magic squares. 
% (An n × n magic square contains the numbers 1, 2, . . . , n2 such that the sum on all rows, columns and diagonals is the same.)
% The program uses brute force search (but gives instantaneous answers)
% (the user inputs ’;’ repeatedly in order to force the search for more solutions):

% example output:

%  ?- magic_square(S).
%  S = [2, 7, 6, 9, 5, 1, 4, 3, 8] ;
%  S = [2, 9, 4, 7, 5, 3, 6, 1, 8] ;
%  S = [4, 3, 8, 9, 5, 1, 2, 7, 6] ;
%  S = [4, 9, 2, 3, 5, 7, 8, 1, 6] ;
%  S = [6, 1, 8, 7, 5, 3, 2, 9, 4] ;
%  S = [6, 7, 2, 1, 5, 9, 8, 3, 4] ;
%  S = [8, 1, 6, 3, 5, 7, 4, 9, 2] ;
%  S = [8, 3, 4, 1, 5, 9, 6, 7, 2] ;
%  false.


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
