
given(1,2,q;2,5,a;3,3,b;4,1,d;4,3,c;5,4,e).
% achieved : initial squares that are filled,
%             row 1 at column 2 with question mark ?
%             row 2 at column 5 with a
%             ...


1 {places(1..5,A,B)} 1 :- A=1..5, B=(a;b;c;d;e).
% achieved : every square of the grid is filled with either of a,b,c,d, or e.


:- given(A,B,S) , not places(A,B,S), S!= q.
% achieved : the given set is a subset of the places set.

S=Z :- places(A,B,S), places(A,B,Z).
% achieved : each location has a unique letter as it's fill

B=C :- places(A,B,S), places(A,C,S).
% achieved : no two columns share the same letter

A=C :- places(A,B,S), places(C,B,S).
% achieved : no two rows share the same letter

S!=Z :- places(A,A,S), places(B,B,Z), A!=B.
% achieved : each diagonal element unique on that diagonal, top left to down right

S!=Z :- places(A,B,S), places(C,D,Z), A+B=6, C+D=6, A!=C, B!=D.
% achieved : each diagonal element unique on that diagonal, top right to down left

answer(A,B,S) :- given(A,B,q), places(A,B,S).
% achieved : The answer for the question mark location where given is q

answer(C) :- answer(A,B,C).
% achieved : The answer holding only the fill and not the location's row and column

#show answer/1.
