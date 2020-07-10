% ASSIGNMENT 9

% Solving a Hitori puzzle by displaying the cell coordinates
% to black out

% Input: grid/3 where grid (X,Y,C) denotes the cell at
%        row X and column Y has the number C

grid( 1,1,4 ; 1,2,8 ; 1,3,1 ; 1,4,6 ; 1,5,3 ; 1,6,2 ; 1,7,5 ; 1,8,7 ;
  	  2,1,3 ; 2,2,6 ; 2,3,7 ; 2,4,2 ; 2,5,1 ; 2,6,6 ; 2,7,5 ; 2,8,4 ;
  	  3,1,2 ; 3,2,3 ; 3,3,4 ; 3,4,8 ; 3,5,2 ; 3,6,8 ; 3,7,6 ; 3,8,1 ;
  	  4,1,4 ; 4,2,1 ; 4,3,6 ; 4,4,5 ; 4,5,7 ; 4,6,7 ; 4,7,3 ; 4,8,5 ;
  	  5,1,7 ; 5,2,2 ; 5,3,3 ; 5,4,1 ; 5,5,8 ; 5,6,5 ; 5,7,1 ; 5,8,2 ;
  	  6,1,3 ; 6,2,5 ; 6,3,6 ; 6,4,7 ; 6,5,3 ; 6,6,1 ; 6,7,8 ; 6,8,4 ;
  	  7,1,6 ; 7,2,4 ; 7,3,2 ; 7,4,3 ; 7,5,5 ; 7,6,4 ; 7,7,7 ; 7,8,8 ;
  	  8,1,8 ; 8,2,7 ; 8,3,1 ; 8,4,4 ; 8,5,2 ; 8,6,3 ; 8,7,5 ; 8,8,6 ).


{blackcells(X,Y)}  :- grid(X,Y,C).
% achieved: Choose a set of any size of cells on the grid 
%           to be blacked out cells.

adjacent(X,Y,X+1,Y) :- grid(X,Y,C; X+1,Y,C).
adjacent(X,Y,X,Y+1) :- grid(X,Y,C; X,Y+1,C).
adjacent(X2,Y2,X1,Y1) :- adjacent(X1,Y1,X2,Y2).
% achieved: Adjacent if a cell has a neighbor next to or
%           below it, accounting for symmetry.

:- grid(X1,Y,C), grid(X2,Y,C), not blackcells(X1,Y), not blackcells(X2,Y), X1 != X2.
:- grid(X,Y1,C), grid(X,Y2,C), not blackcells(X,Y1), not blackcells(X,Y2), Y1 != Y2.
% achieved: No row or column has more than one ocurrence
%           of any number.

:- adjacent(X1,Y1,X2,Y2), blackcells(X1,Y1), blackcells(X2,Y2).
% achieved: Blacked out cells are not adjacent (can be diagonal).

connected(1,X) :- X=1..2, not blackcell(1,X).
% achieved: fixed point for connected(X,Y), not both connected(1,1) and connected(1,2) can be blacked out.

connected(X2,Y2) :- connected(X1,Y1), adjacent(X1,Y1,X2,Y2), not blackcells(X2,Y2).
% achieved: Connected if a number cell is adjacent to another 
%           number cell, starting with the cell at (1,1).

:- grid(X,Y,C), not blackcells(X,Y), not connected(X,Y).
% achieved: Number cells must be connected horizontally or
%           vertically.

#show blackcells/2.


%%%% OUTPUT %%%%
%
% blackcells(1,1) blackcells(1,3) blackcells(6,5) blackcells(1,7) blackcells(8,7)
% blackcells(6,1) blackcells(6,8) blackcells(8,5) blackcells(4,3) blackcells(2,6)
% blackcells(3,1) blackcells(3,4) blackcells(4,8) blackcells(4,6) blackcells(5,2)
% blackcells(5,4) blackcells(7,2)
%
%%%%%%%%%%%%%%%%
