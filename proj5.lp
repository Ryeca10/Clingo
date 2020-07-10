#const m = n**2/3.
% achieved: the number of trominoes (3x1 tiles)
%           needed to fill the board is equivalent
%           to [n squared divided by 3]

1 { tile(R,C): R = 1..n, C = 1..n } 1.
% achieved: one spot on the board is filled with the 1x1 tile at ro R and column C

m { trimino((R1,C1), (R2,C2), (R3,C3)): R1 = 1..n, R2 = 1..n, R3 = 1..n, C1 = 1..n, C2 = 1..n, C3 = 1..n} m.
% achieved: m trimios each containing 3 tiles (R1,C1), (R2,C2), and (R3,C3), each variable Ri, Ci in 1..n.

:- tile(R,C), trimino((R,C), _, _).
:- tile(R,C), trimino(_, (R,C), _).
:- tile(R,C), trimino(_, _, (R,C)).
% achieved: no trimino overlaps with the tile

:- trimino(A, B, _), trimino(A, C, _), C!=B.
:- trimino(A, _, B), trimino(A, _, C), C!=B.
% achieved: no two triminos share the same first tile

:- trimino(B, A, _), trimino(C, A, _), C!=B.
:- trimino(_, A, B), trimino(_, A, C), C!=B.
% achieved: no two triminos share the same second tile

:- trimino(B, _, A), trimino(C, _, A), C!=B.
:- trimino(_, B, A), trimino(_, C, A), C!=B.
% achieved: no two triminos share the same third tile

:- trimino(A, _, _), trimino(_, A, _).
:- trimino(A, _, _), trimino(_, _, A).
:- trimino(_, A, _), trimino(_, _, A).
% achieved: no two triminos share a tile which is placed out of order

:- trimino(A, B, _), A=B.
:- trimino(_, A, B), A=B.
:- trimino(A, _, B), A=B.
% achieved: a trimino doesn't have two identical tiles

:- trimino((R1,C1), (R2,C2), (R3,C3)), R1=R3, R2!=R3.
:- trimino((R1,C1), (R2,C2), (R3,C3)), R2=R3, R1!=R3.
:- trimino((R1,C1), (R2,C2), (R3,C3)), R1=R2, R2!=R3.
% achieved: a trimino doesn't have two only two tiles on the same row

:- trimino((R1,C1), (R2,C2), (R3,C3)), C1=C3, C2!=C3.
:- trimino((R1,C1), (R2,C2), (R3,C3)), C2=C3, C1!=C3.
:- trimino((R1,C1), (R2,C2), (R3,C3)), C1=C2, C2!=C3.
% achieved: a trimino doesn't have two only two tiles on the same column

R2 = R1 + 1:- trimino((R1,C1), (R2,C2), _), C1=C2.
R2 = R1 + 1:- trimino(_, (R1,C1), (R2,C2)), C1=C2.
% achieved: if tile columns are equal, their rows are one apart

C2 = C1 + 1:- trimino((R1,C1), (R2,C2), _), R1=R2.
C2 = C1 + 1:- trimino(_, (R1,C1), (R2,C2)), R1=R2.
% achieved: if tile rows are equal, their columns are one apart

:- trimino((R1,C1), (R2,C2), _), C1!=C2, R1!=R2.
:- trimino((R1,C1), _, (R2,C2)), C1!=C2, R1!=R2.
:- trimino(_, (R1,C1), (R2,C2)), C1!=C2, R1!=R2.
% achieved: a trimino doesnt have any two tiles on a diagonal


% show
#show tile/2.
#show trimino/3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   n = 7, 2534 ways
%   n = 5, 2 ways
%   n = 4, 16 ways
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   clingo version 5.1.0
%   Reading from proj5.lp
%   Solving...
%   Answer: 1
%   trimino((1,1),(1,2),(1,3)) trimino((1,6),(1,7),(1,8)) trimino((1,4),(2,4),(3,4))
%   trimino((1,5),(2,5),(3,5)) trimino((2,1),(2,2),(2,3)) trimino((2,6),(2,7),(2,8))
%   trimino((3,1),(4,1),(5,1)) trimino((3,2),(4,2),(5,2)) trimino((3,6),(4,6),(5,6))
%   trimino((3,7),(4,7),(5,7)) trimino((3,8),(4,8),(5,8)) trimino((4,3),(5,3),(6,3))
%   trimino((4,4),(5,4),(6,4)) trimino((4,5),(5,5),(6,5)) trimino((6,6),(6,7),(6,8))
%   trimino((6,1),(7,1),(8,1)) trimino((6,2),(7,2),(8,2)) trimino((7,3),(7,4),(7,5))
%   trimino((7,6),(7,7),(7,8)) trimino((8,3),(8,4),(8,5)) trimino((8,6),(8,7),(8,8))
%   tile(3,3)
%   SATISFIABLE
%
%   Models       : 1+
%   Calls        : 1
%   Time         : 4.741s (Solving: 0.07s 1st Model: 0.07s Unsat: 0.00s)
%   CPU Time     : 4.440s
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


