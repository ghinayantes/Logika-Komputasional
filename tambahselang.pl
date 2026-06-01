tambahselang(X, X, X).
tambahselang(X, Y, Z) :-
    X =< Y,
    Y1 is Y - 1,
    tambahselang(X, Y1, Z1),
    Z is Y + Z1.