

composite(N) :- N = 1 .. n+2 , I = 2 .. N-1, N\I = 0.
 % achieved : composite (N) iff N is a composite number 
 %		from { 1 , ... , n+2}.

prime(N) :- N = 2 .. n+2 , not composite(N).
% achieved : prime(N) iff N is a prime number 
%		from { 1 , ... , n+2}.

twin(N) :- N = 2 .. n , prime(N), prime(N-2).
% achieved : twin(N) iff N is a twin prime such that N-2 is also a prime
%		from { 1 , ... , n}.

twin(N) :- N = 2 .. n , prime(N), prime(N+2).
% achieved : twin(N) iff N is a twin prime such that N+2 is also a prime
%		from { 1 , ... , n}.


%****************************************************************************
% Other ways 
%****************************************************************************
%	composite(N) :- N = 1 .. n+2 , I = 2 .. N-1, N\I = 0.
%	prime(N) :- N = 2 .. n+2 , not composite(N).
%	twin(N) :- N = 2 .. n , M = 2 .. n + 2,  prime(N), prime(M), |M-N| = 2.
%****************************************************************************
%	composite(N) :- N = 1 .. n+2 , I = 2 .. N-1, N\I = 0.
%	prime(N) :- N = 2 .. n+2 , not composite(N).
%	twin(N) :- N = 2 .. n , M = (N-2;N+2),  prime(N), prime(M).
%****************************************************************************

%****************************************************************************
% OUTPUT
%****************************************************************************
%	clingo version 5.0.0
%	Solving...
%	Answer: 1
%	composite(4) composite(6) composite(8) composite(9) composite(10) composite(12) composite(14) composite(15) composite(16) 
%	composite(18) composite(20) composite(21) composite(22) composite(24) composite(25) composite(26) composite(27) composite(28) 
%	composite(30) composite(32) prime(2) prime(3) prime(5) prime(7) prime(11) prime(13) prime(17) prime(19) prime(23) prime(29) 
%	prime(31) twin(5) twin(7) twin(13) twin(19) twin(3) twin(11) twin(17) twin(29)
%	SATISFIABLE
%
%	Models       : 1
%	Calls        : 1
%	Time         : 0.028s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
%	CPU Time     : 0.000s
%****************************************************************************
