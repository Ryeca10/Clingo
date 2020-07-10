#const k = 3.

member(a;b;c;d;e).  
paper(f;g;h;p;q;r;s;t).
short(f;g;h).       
long(p;q;r;s;t).    


pref(a,f,yes; a,g,yes; a,h,yes; a,p,yes; a,q,yes; a,r,no; a,s,no; a,t,maybe;
     b,f,yes; b,g,maybe; b,h,maybe; b,p,yes; b,q,yes; b,r,no; b,s,yes; b,t,yes;
     c,f,maybe; c,g,yes; c,h,maybe; c,p,no; c,q,yes; c,r,yes; c,s,yes; c,t,maybe;
     d,f,yes; d,g,maybe; d,h,maybe; d,p,no; d,q,yes; d,r,yes; d,s,maybe; d,t,maybe;
     e,f,no; e,g,yes; e,h,maybe; e,p,maybe; e,q,no; e,r,maybe; e,s,yes; e,t,yes).

% achieved: pref/3 = set of preferences pref(M,P,X) where
%           M = committee member's assigned letter;
%           P = paper's assigned letter;
%           X = M's preference on paper P (yes, no, maybe).


 {matchyes(M,P) : member(M)} :- paper(P).
:- matchyes(M,P), pref(M,P,maybe).
:- matchyes(M,P), pref(M,P,no).
% achieved: all possible combintions of members who said yes to a paper

 {matchmaybe(M,P) : member(M)} :- paper(P).
:- matchmaybe(M,P), pref(M,P,yes).
:- matchmaybe(M,P), pref(M,P,no).
% achieved: all possible combintions of members who said maybe to a paper

match(M,P) :- matchyes(M,P).
match(M,P) :- matchmaybe(M,P).
% achieved: all possible combintions of members who said yes or maybe to a paper

k {assign(M,P) : match(M,P) } k :- paper(P).
% achieved: three paper reviews either of a match-yes or of a match-maybe situation

workload(M,W) :- W = #sum{1,P : assign(M,P), short(P); 2,P : assign(M,P), long(P)}, member(M).
% achieved: workload(M,W) where W is the summed workload
%           for member M; short paper is worth 1, long is worth 2.

:- workload(M,W), workload(M2,W2), |W-W2| > 1.
% achieved: workloads are approximately equal (within 1)


matchyescount(N) :- N = #count{P,M: matchyes(M,P)}.
matchmaybecount(N) :- N = #count{P,M: matchmaybe(M,P)}.

#maximize{M: matchyescount(M)}.
% achieved: maximizes number of match-yes

%#minimize{M: matchmaybecount(M)}.
% achieved: minimizes number of match-maybe


#show assign/2.
#show matchyes/2.
#show matchyescount/2.
%#show match/2.
#show workload/2.
#show matchyescount/1.
