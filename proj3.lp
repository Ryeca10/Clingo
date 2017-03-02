
#const n=6. 

1 {at(1..n,S)} 1 :- S=1..n.

seats(1..n).

adjacent(S1,S2) :- seats(S1), seats(S2), S2 = S1-1.
adjacent(S1,S2) :- seats(S1), seats(S2), S2 = S1+1.
adjacent(S1,S2) :- S1 = 1, S2 = n.
adjacent(S1,S2) :- S1 = n, S2 = 1.


S1=S2 :- at(G,S1), at(G,S2).

sit(G1,G2) :- at(G1,S1), at(G2,S2), like(G1,G2), adjacent(S1,S2).


:- at(G1,S1), dislike(G1,S1).

:- at(G1,G2), at(G2,G3), not like(G1,G2), not like(G2,G3), like(G2,G4), G4!=G3,G4!=G1.

:- at(G1,S1), G1=S1.
:- at(G1,S1), at(S1,G1).

like(1,2; 3,4).
dislike(2,3; 1,3).

#show at/2.

