:- redefine_system_predicate(elem(_,_)).
   elem([X|_],X).
   elem([_|L],X) :- elem(X,L).

:- redefine_system_predicate(len(_,_)).
len([],0).
len([_|L],N) :- len(L,M), N is M+1.

word(abalone,  a,b,a,l,o,n,e).
word(abandon,  a,b,a,n,d,o,n).
word(anagram,  a,n,a,g,r,a,m).
word(connect,  c,o,n,n,e,c,t).
word(elegant,  e,l,e,g,a,n,t).
word(enhance,  e,n,h,a,n,c,e).

crossword(V1,V2,V3,H1,H2,H3) :-
    word(H1,_,H12V12,_,H14V22,_,H16V32,_),
    word(H2,_,H22V14,_,H24V24,_,H26V34,_),
    word(H3,_,H32V16,_,H34V26,_,H36V36,_),
    word(V1,_,H12V12,_,H22V14,_,H32V16,_), 
    word(V2,_,H14V22,_,H24V24,_,H34V26,_), 
    word(V3,_,H16V32,_,H26V34,_,H36V36,_).