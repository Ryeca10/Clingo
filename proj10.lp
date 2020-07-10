#const t = 1.
block(a;b;c).

% state 7
tail(on(a,b); on(b,table); on(c,table)).

location(X) :- block(X).
location(table;hand).

% Definition of the state at time t-1
h(F,t-1) :- tail(F).

0 {pickup(B, t)} 1 :- block(B), location(L), h(on(B,L),t-1), L!=hand.
% achieved: A pickup action at t is executed (pickup of block X) between times t-1 and t+1'

h(on(B,hand),t) :- pickup(B, t).

0{putdown(L, t)}1 :- h(on(B,hand),t-1), location(L), L!=hand, B!=L.

h(on(B,L), t) :- not pickup(B,t), not putdown(L,t), h(on(B,L), t-1), block(B), location(L), L!=hand.

h(on(B,L), t) :- putdown(L,t), h(on(B,hand), t-1).



% That action is not executable
% if B is not clear :
:- pickup(B,t), h(on( B1,B), t-1).

:- pickup(B,t), h(on(B1,hand), t-1).

% or if L is a block that is not clear :
:- putdown(L,t), h(on(B1,L), t-1), block(L).

X+Y=1 :- Y = #count{ B: pickup(B, t)}, X = #count{L: putdown(L,t)}.

#show pickup/2.
#show putdown/2.
#show h/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   State 7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   MadHatter:Desktop Hatter$ clingo proj10.lp 0
%   clingo version 5.1.0
%   Reading from proj10.lp
%   Solving...
%   Answer: 1
%   h(on(a,b),0) h(on(b,table),0) h(on(c,table),0) pickup(a,1) h(on(b,table),1) h(on(c,table),1)
%   h(on(a,hand),1) h(on(b,table),2) h(on(c,table),2) h(on(a,table),2) putdown(table,2)
%   Answer: 2
%   h(on(a,b),0) h(on(b,table),0) h(on(c,table),0) pickup(a,1) h(on(b,table),1) h(on(c,table),1)
%   h(on(a,hand),1) h(on(b,table),2) h(on(c,table),2) h(on(a,c),2) putdown(c,2)
%   Answer: 3
%   h(on(a,b),0) h(on(b,table),0) h(on(c,table),0) h(on(a,b),1) h(on(b,table),1) pickup(c,1)
%   h(on(c,hand),1) h(on(a,b),2) h(on(b,table),2) putdown(a,2) h(on(c,a),2)
%   SATISFIABLE
%
%   Models       : 3
%   Calls        : 1
%   Time         : 0.004s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
%   CPU Time     : 0.000s
%   MadHatter:Desktop Hatter$
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   State 14
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   MadHatter:Desktop Hatter$ clingo proj10.lp 0
%   clingo version 4.5.4
%   Reading from pSroj10.lp
%   Solving...
%   Answer: 1
%   h(on(a,b),0) h(on(b,c),0) h(on(c,table),0) pickup(a,1) h(on(b,c),1) h(on(c,table),1) h(on(a,hand),1)
%   h(on(b,c),2) h(on(c,table),2) h(on(a,table),2) putdown(table,2)
%   SATISFIABLE
%
%   Models       : 1
%   Calls        : 1
%   Time         : 0.004s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
%   CPU Time     : 0.000s
%   MadHatter:Desktop Hatter$
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

