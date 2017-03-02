
1 {in(I,1..r)} 1 :- I=1..n.
% achieved: Set {1,...,n} is partitioned into
%           subsets {I:in(I,1)},...,{I:in(I,r)}.

:- in(I,S), in(J,S), in(K,S), K-J=J-I, J!=I. 
% achieved: Where there is an I, J, and K within set S, K-J != J-I, 
%           and all 3 are unique, these subsets do not contain
%           arithmetic progressions of length 3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OUTPUT:
%
% For r = 2, the largest value for n is 8:
%
% clingo version 5.2.0
% Reading from stdin
% Solving...
% Answer: 1
% in(3,1) in(4,1) in(7,1) in(1,2) in(2,2) in(5,2) in(8,1) in(6,2)
% SATISFIABLE
%
% Models       : 1+
% Calls        : 1
% Time         : 0.227s (Solving: 0.01s 1st Model: 0.01s Unsat: 0.00s)
% CPU Time     : 0.000s
%
%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For r = 3, the largest value for n is 26:
%
% clingo version 5.2.0
% Reading from stdin
% Solving...
% Answer: 1
% in(3,1) in(4,1) in(7,1) in(9,1) in(19,1) in(11,2) in(13,2) in(8,2) 
% in(10,2) in(23,2) in(25,2) in(1,3) in(2,3) in(5,3) in(6,3) in(15,3) 
% in(17,3) in(21,3) in(12,3) in(16,1) in(18,1) in(24,1) in(26,1) 
% in(20,2) in(22,2) in(14,3)
% SATISFIABLE

% Models       : 1+
% Calls        : 1
% Time         : 0.120s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
% CPU Time     : 0.000s
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Other Solutions:
%
%     1 {in(I,1..r)} 1 :- I=1..n.
%     :- in(I,S), in(J,S), in(K,S), K-J=J-I, K!=I.
%
%     Or
%
%     1 {in(I,1..r)} 1 :- I=1..n.
%     :- in(I,S), in(J,S), in(K,S), K-J=J-I, K!=J.
%
%     If K-J=J-I then J!=I implies J!=K and K!=I
%     Proof: if J=K then K-J=0 impliying that J-I must be zero
%           which is the same as J=I, contradiction.
%
%           if K=I then K-J=J-I is the same as K-J=J-K 
%           hence 2K = 2J and since K=I, implying that J=I, contradiction.
%
%     **  The same procedure can be used to prove correctness of the 
%         other solutions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
