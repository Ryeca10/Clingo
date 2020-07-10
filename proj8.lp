last(engels; gunter; halevy; foster).
first(duane; abner; chuck; bruce).
petname(sparky; waggles).
pet(iguana; cobra; jackal; llama).

4 {fullnamepet(X,Y,Z) : first(X), last(Y), pet(Z)} 4.


% rule 7
:- fullnamepet(_,halevy,iguana).

% rule 6
:- fullnamepet(bruce,foster,_).

% rule 5
:- fullnamepet(abner,gunter,_).
:- fullnamepet(abner,_,cobra).

% rule 4
:- fullnamepet(duane,_,llama).
:- fullnamepet(duane,engels,_).

% rule 3
:- fullnamepet(_,foster,cobra).
:- fullnamepet(_,foster,jackal).

% rule 2
:- fullnamepet(chuck,_,iguana).
:- fullnamepet(duane,_,iguana).

% rule 1
:- fullnamepet(abner,engels,_).
:- fullnamepet(abner,foster,_).

% other
:- fullnamepet(X,Y1,_) , fullnamepet(X,Y2,_), Y1 != Y2.
:- fullnamepet(X,_,Z1) , fullnamepet(X,_,Z2), Z1 != Z2.
:- fullnamepet(X1,Y,_) , fullnamepet(X2,Y,_), X1 != X2.
:- fullnamepet(_,Y,Z1) , fullnamepet(_,Y,Z2), Z1 != Z2.
:- fullnamepet(X1,_,Z) , fullnamepet(X2,_,Z), X1 != X2.
:- fullnamepet(_,Y1,Z) , fullnamepet(_,Y2,Z), Y1 != Y2.



#show fullnamepet/3.
