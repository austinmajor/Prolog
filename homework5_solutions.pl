/*
 * The goal of this assignment is to prepare your computer for running Prolog programs, and for you to learn the basics of editing/compiling/executing by working with simple Prolog programs. So it is essential that you complete this assignment soon in order to become ready for later assignments. Please carry out the following installation step on your personal computer:
 * 
 * Download the Prolog Environment: Visit http://www.swi-prolog.org/download/stable and install the SWI-Prolog Environment for the operating system on your computer. You're recommended to also download the SWI-Prolog Reference Manual PDF-file from that page.
 *
 * This installation will set your computer up for all future Prolog assignments. 
 *
 *
 * Start SWI-Prolog, and load this file. 
 *
 *
 * Q1 (zero point): play with this program by entering some queries to see if you get expected answers. You're free to think of your own queries, but here are some examples:
 * a) Is gary a sibling of mary?
 * b) Who are the parents of bill? 
 * c) Give all pairs of cousins.
 * d) Give all aunts of tom.
 * 
 *
 * Q2 (10 pooints): Edit this file and add to it rules for the ancestor relation between individuals. An ancestor is either a parent, or an ancestor of a parent. Also add facts for the following pieces of information:
 * a) tom is the father of bob.
 * b) bob is the father of ann and pat.
 * c) pam is the mother of bob.
 * 
 * Reload this file after modification, and test your new rules and facts. Once you get everything to run as expected, submit your modified file.
 */

ancestor(X,Y) :- parent(X,Y); ancestor(X,Z), parent(Z,Y).

father(tom,bob).
father(bob,ann).
father(bob,pat).
mother(pam,bob).

aunt(A,X) :- sister(A,B), parent(B,X).

parent(P,C) :- father(P,C).
parent(P,C) :- mother(P,C).

cousin(C,S) :- parent(F,C), sibling(F,B), parent(B,S).

sibling(C,S) :- brother(C,S).
sibling(C,S) :- sister(C,S).

father(jim,linda).
father(jim,harry).
father(john,bill).
father(john,will).
father(frank,tom).
father(frank,gary).
father(frank,mary).

mother(beth,linda).
mother(beth,harry).
mother(janice,bill).
mother(janice,will).
mother(liz,tom).
mother(liz,gary).
mother(liz,mary).

sister(linda,harry).
sister(mary,tom).
sister(mary,gary).
sister(beth,john).
sister(beth,frank).

brother(harry,linda).
brother(bill,will).
brother(will,bill).
brother(tom,gary).
brother(gary,tom).
brother(tom,mary).
brother(gary,mary).
brother(john,beth).
brother(john,frank).
brother(frank,john).
brother(frank,beth).
