hoosier(schafer).
hoosier(wallingford).
hoosier(letterman).
childOf(margaret, schafer).
childOf(abraham, letterman).
childOf(sarah, wallingford).
daughter(margaret, schafer).
daughter(sarah, wallingford).

childOf(X, Y) :-
    daughter(X, Y).
    
likes(X, basket) :-
    hoosier(X).
likes(X, basket) :-
    childOf(X, Y),
    likes(Y, basket).
likes(X, maret) :-
    likes(X, basket).

