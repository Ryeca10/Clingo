candidate(a;b;c).
% achieved: cadidates are a, b, and c

votecount(1,400;2,200;3,300).
% achieved: votecounts for rounds 1, 2, and 3

p(1,1,c; 1,2,b; 1,3,a; 
  2,1,b ; 2,2,c; 2,3,a;
  3,1,a; 3,2,b ; 3,3,c).
% achieved: rank of each candidate in each round

votes(Candidate,Votes) :- p(Round, Place, Candidate), votecount(Round, Votes2), Votes = Votes2 * (3 - Place).
% achieved: scaled voting values in each distinct round 1 , 2 , or 3

totalvotes(Candidate, TotalVotes) :- candidate(Candidate), TotalVotes = #sum {Votes : votes(Candidate,Votes) }.
% achieved: sum of the scaled voting values for each candidate

highestvotes(Votes) :- Votes = #max{TotalVotes, Candidate : totalvotes(Candidate, TotalVotes)}.
% achieved: votes of the candidate with the highest votes

winner(Candidate) :- highestvotes(TotalVotes), totalvotes(Candidate, TotalVotes).
% achieved: candidate with the highest votes

#show winner/1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Last login: Mon Mar 27 22:35:58 on ttys001
%   MadHatter:~ Hatter$ cd Desktop
%   MadHatter:Desktop Hatter$ clingo proj6.lp
%   clingo version 5.1.0
%   Reading from proj6.lp
%   Solving...
%   Answer: 1
%   winner(c)
%   SATISFIABLE
%
%   Models       : 1
%   Calls        : 1
%   Time         : 0.003s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
%   CPU Time     : 0.000s
%   MadHatter:Desktop Hatter$
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
