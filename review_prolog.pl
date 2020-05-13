% Q1. Exercise  1.5 Suppose we are working with the following knowledge base: 

wizard(ron). 
wizard(X):- hasBroom(X),  hasWand(X). 
hasWand(harry). 
quidditchPlayer(harry). 
hasBroom(X):- quidditchPlayer(X).


% How does Prolog respond to the following queries?
% wizard(ron).
% witch(ron).
% wizard(hermione).
% witch(hermione).
% wizard(harry).
% wizard(Y).


% Q2. Exercise  2.4 Here are six Italian words:
% astante , astoria , baratto , cobalto , pistola , statale .
% They are to be arranged, crossword puzzle fashion, in the following grid:

%%      V1  V2  V3
%%      _   _   _
%% H1 _ _ _ _ _ _ _
%%      _   _   _
%% H2 _ _ _ _ _ _ _
%%      _   _   _
%% H3 _ _ _ _ _ _ _
%%      _   _   _
% The following knowledge base represents a lexicon containing these words:

word(astante,  a,s,t,a,n,t,e). 
word(astoria,  a,s,t,o,r,i,a). 
word(baratto,  b,a,r,a,t,t,o). 
word(cobalto,  c,o,b,a,l,t,o). 
word(pistola,  p,i,s,t,o,l,a). 
word(statale,  s,t,a,t,a,l,e).

% Write a predicate crossword/6 that tells us how to fill in the grid. The first three arguments should be the vertical words from left to right, and the last three arguments the horizontal words from top to bottom.

crossword(V1,V2,V3,H1,H2,H3) :-
  %% Make the word intersect at the right places.
  word(H1,_,H12V12,_,H14V22,_,H16V32,_),
  word(H2,_,H22V14,_,H24V24,_,H26V34,_),
  word(H3,_,H32V16,_,H34V26,_,H36V36,_),

  word(V1,_,H12V12,_,H22V14,_,H32V16,_),
  word(V2,_,H14V22,_,H24V24,_,H34V26,_),
  word(V3,_,H16V32,_,H26V34,_,H36V36,_).


% Q3. Exercise  3.3 We have the following knowledge base:

directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

% That is, this knowledge base holds facts about towns it is possible to travel between by taking a direct train. But of course, we can travel further by chaining together direct train journeys. Write a recursive predicate travelFromTo/2 that tells us when we can travel by train between two towns. For example, when given the query

% travelFromTo(nancy,saarbruecken). 
% it should reply yes.


travelFromTo(X,Y) :- directTrain(X,Y).
travelFromTo(X,Y) :-
  directTrain(X,Z),
  travelFromTo(Z,Y).


% Q4. Exercise  4.5 Suppose we are given a knowledge base with the following facts:

tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

% Write a predicate listtran(G,E) which translates a list of German number words to the corresponding list of English number words. For example:

   % listtran([eins,neun,zwei],X).
   
% should give:

   % X  =  [one,nine,two].

% Your program should also work in the other direction. For example, if you give it the query

   % listtran(X,[one,seven,six,two]).
   
% it should return:

   % X  =  [eins,sieben,sechs,zwei].

% (Hint: to answer this question, first ask yourself “How do I translate the empty list of number words?”. That’s the base case. For non-empty lists, first translate the head of the list, then use recursion to translate the tail.)

listtran([], []).
listtran([Hg | Tg], [He | Te]) :-
  tran(Hg, He),
  listtran(Tg, Te).

 
% Q5. (not in the exam) The predicate count(L,X,N), which holds iff X is the element occurring N times in the list L. The following are some example queries: 
%
%? count( [a,a,b,a,c,b,a], X, 2). 
% X=b
%? count( [a,a,b,a,c,b,a], c, 2). 
% false

count( [], _, 0).
count( [X|T],X, N) :- count( T,X, M), N is M+1. % N is 2, M #= N-1. % GNU Prolog #=
count( [H|T],Y, N) :- count( T,Y, N), not(Y=H).

% Discussions: 
% - Logic programming vs. functional programming vs. imperative programming. Prolog does not return a value or a function. 
% - Logic paradigm: X is Y, if A is B. 
% The length of a list => 
% The length of the list is N =>
% The length of list is 0 if the list is empty, OR, 
% The length of list is N if the length of the tail of the list is N-1, if the list is not empty.

% - Logic is about reasoning; Boolean is about true/false. Prolog tells us what it can resolve, it cannot tell us what it cannot resolve. 

% fruit(apple). % apple is fruit.
% sweet(X):- fruit(X). % fruit is sweet.

% sweet(apple). % so apple is sweet.

% not(fruit(sugar)).
% => not(sweet(sugar))?

% Logic below is not the same (failure).
% sweet(X):- fruit(X). % fruit is sweet.
% bitter(X):- not (fruit(X)). % not fruit is not sweet (bitter)?

% Boolean (negation).
% A=true. Not(A)==false.


% Q6. Define the predicate last(L, X), which is true if X is the last element of the list L. The following are some example queries:

% ? last( [1, 2, 3], 3 ). true
% ? last( [1, 2, 3, 4], X ). X=4
% ? last( [], X ).
% false
%
last([X],X).  
last([_|T],X):-last(T,X).

% Are these rules sufficient to deterministrically determine the last element? If not, what do we do?





